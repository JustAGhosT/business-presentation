# -----------------------------------------------
# Markdown conversion helper functions
# -----------------------------------------------

# Convert markdown to output formats
function Convert-MarkdownFiles {
    param (
        [string]$InputDirectory,
        [string]$OutputDirectory,
        [string[]]$Formats = @("pdf"),
        [switch]$Recursive,
        [hashtable]$FormatOptions = @{},
        [string]$PandocPath
    )

    # Create base output directory if it doesn't exist
    if (-not (Test-Path -Path $OutputDirectory)) {
        New-Item -Path $OutputDirectory -ItemType Directory -Force | Out-Null
        Write-Log -Message "Created output directory: $OutputDirectory"
    }

    # Initialize results tracking
    $results = @{}
    foreach ($format in $Formats) {
        $results[$format] = @{
            Success = 0
            Error = 0
            Files = @()
        }
        
        # Create format-specific output directory
        $formatOutputDir = Join-Path -Path $OutputDirectory -ChildPath $FormatOptions[$format].outputDir
        if (-not (Test-Path -Path $formatOutputDir)) {
            New-Item -Path $formatOutputDir -ItemType Directory -Force | Out-Null
            Write-Log -Message "Created format output directory: $formatOutputDir"
        }
    }

    # Get markdown files
    $files = Get-ChildItem -Path $InputDirectory -Filter "*.md" -Recurse:$Recursive
    $totalFiles = $files.Count

    Write-Host "`nStarting conversion of $totalFiles Markdown files...`n" -ForegroundColor Cyan
    Write-Log -Message "Starting conversion of $totalFiles Markdown files from $InputDirectory"

    # Check if we found any files
    if ($totalFiles -eq 0) {
        Write-Host "No markdown files found in $InputDirectory" -ForegroundColor Yellow
        Write-Log -Message "No markdown files found in $InputDirectory"
        return $OutputDirectory
    }

    # Process each file
    $fileCounter = 0
    foreach ($file in $files) {
        $fileCounter++
        Write-Host "[$fileCounter/$totalFiles] Converting: $($file.Name)" -ForegroundColor Yellow
        Write-Log -Message "Converting file: $($file.FullName)"

        foreach ($format in $Formats) {
            # Define output file path
            $formatOutputDir = Join-Path -Path $OutputDirectory -ChildPath $FormatOptions[$format].outputDir
            $outputFileName = [System.IO.Path]::GetFileNameWithoutExtension($file.Name) + ".$format"
            $outputFile = Join-Path -Path $formatOutputDir -ChildPath $outputFileName

            # Run pandoc with error handling
            try {
                # Create the command string properly
                $cmdArgs = @(
                    "-f", "markdown"
                    "-t", $format
                    "`"$($file.FullName)`""
                    "-o", "`"$outputFile`""
                ) + $FormatOptions[$format].args
                
                $cmdDisplay = "$PandocPath -f markdown -t $format `"$($file.FullName)`" -o `"$outputFile`" $($FormatOptions[$format].args -join ' ')"
                Write-Host "  Running: $cmdDisplay" -ForegroundColor Gray
                Write-Log -Message "Running command: $cmdDisplay"
                
                # Execute pandoc using ProcessStartInfo for better handling of quotes and spaces
                $psi = New-Object System.Diagnostics.ProcessStartInfo
                $psi.FileName = $PandocPath
                $psi.Arguments = "-f markdown -t $format `"$($file.FullName)`" -o `"$outputFile`" $($FormatOptions[$format].args -join ' ')"
                $psi.UseShellExecute = $false
                $psi.RedirectStandardOutput = $true
                $psi.RedirectStandardError = $true
                $psi.CreateNoWindow = $true
                
                $process = New-Object System.Diagnostics.Process
                $process.StartInfo = $psi
                $process.Start() | Out-Null
                
                $stdout = $process.StandardOutput.ReadToEnd()
                $stderr = $process.StandardError.ReadToEnd()
                $process.WaitForExit()
                $exitCode = $process.ExitCode
                
                if ($exitCode -eq 0 -and (Test-Path $outputFile)) {
                    Write-Host "  ✓ Success: Created $format file" -ForegroundColor Green
                    Write-Log -Message "Successfully created $outputFile"
                    $results[$format].Success++
                }
                else {
                    Write-Host "  ✗ Error: Failed to convert to $format (Exit code: $exitCode)" -ForegroundColor Red
                    if ($stderr) {
                        Write-Host "    Error details: $stderr" -ForegroundColor Red
                        Write-Log -Message "Error converting to $format`: $stderr" -Level "ERROR"
                        
                        # Show helpful message for common PDF engine errors
                        if ($stderr -match "(xe|pdf)latex not found") {
                            Write-Host "`n    SOLUTION: The selected PDF engine is not installed." -ForegroundColor Yellow
                            Write-Host "    Try selecting a different engine in advanced options or install the required software." -ForegroundColor Yellow
                            
                            if (-not $script:config.InstallGuideShown) {
                                Show-PdfEngineInstallInstructions
                                $script:config.InstallGuideShown = $true
                            }
                        }
                    }
                    $results[$format].Error++
                    $results[$format].Files += $file.Name
                }
            }
            catch {
                Write-Host "  ✗ Error: Failed to convert to $format" -ForegroundColor Red
                Write-Host "    Error details: $_" -ForegroundColor Red
                Write-Log -Message "Exception converting to $format`: $_" -Level "ERROR"
                $results[$format].Error++
                $results[$format].Files += $file.Name
            }
        }
    }

    # Display summary
    Write-Host "`nConversion Summary:" -ForegroundColor Cyan
    Write-Host "===================" -ForegroundColor Cyan

    foreach ($format in $Formats) {
        Write-Host "`n$($format.ToUpper()) Conversion:" -ForegroundColor Yellow
        Write-Host "✓ Successfully converted: $($results[$format].Success) files" -ForegroundColor Green
        Write-Host "✗ Failed to convert: $($results[$format].Error) files" -ForegroundColor $(if ($results[$format].Error -gt 0) { "Red" } else { "Green" })
        
        if ($results[$format].Error -gt 0) {
            Write-Host "  Failed files:" -ForegroundColor Red
            foreach ($failedFile in $results[$format].Files) {
                Write-Host "    - $failedFile" -ForegroundColor Red
            }
        }
        
        $formatDir = Join-Path -Path $OutputDirectory -ChildPath $FormatOptions[$format].outputDir
        Write-Host "Output directory: $formatDir"
    }

    return $OutputDirectory
}

