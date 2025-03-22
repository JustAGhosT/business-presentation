# -----------------------------------------------
# Pandoc-related helper functions
# -----------------------------------------------

# Find Pandoc in the system
function Find-PandocInstallation {
    try {
        $pandocCommand = Get-Command pandoc -ErrorAction Stop
        $pandocPath = $pandocCommand.Path
        Write-Host "Found Pandoc in PATH: $pandocPath" -ForegroundColor Green
        return $pandocPath
    }
    catch {
        Write-Host "Pandoc not found in PATH, checking common installation locations..." -ForegroundColor Yellow
        
        # Check common installation paths
        $possiblePaths = @(
            "C:\Program Files\Pandoc\pandoc.exe",
            "C:\Program Files (x86)\Pandoc\pandoc.exe",
            "$env:LOCALAPPDATA\Pandoc\pandoc.exe",
            "$env:ProgramData\chocolatey\bin\pandoc.exe"
        )
        
        $pandocPath = $null
        foreach ($path in $possiblePaths) {
            if (Test-Path $path) {
                $pandocPath = $path
                Write-Host "Found Pandoc at: $path" -ForegroundColor Green
                return $pandocPath
            }
        }
        
        return $null
    }
}

# Show Pandoc installation instructions
function Show-PandocInstallInstructions {
    Write-Host "`n===== PANDOC INSTALLATION REQUIRED =====" -ForegroundColor Red
    Write-Host "Pandoc is required for this script to work." -ForegroundColor Yellow
    Write-Host "`nInstallation options:"
    Write-Host "1. Download from official website: https://pandoc.org/installing.html"
    Write-Host "2. Install with Chocolatey (if installed): choco install pandoc"
    Write-Host "3. Install with Scoop (if installed): scoop install pandoc"
    Write-Host "`nAfter installing, restart this script." -ForegroundColor Yellow
}

# Show PDF engine installation instructions
function Show-PdfEngineInstallInstructions {
    Write-Host "`n===== PDF ENGINE INSTALLATION RECOMMENDED =====" -ForegroundColor Yellow
    Write-Host "No PDF engines were detected on your system." -ForegroundColor Yellow
    Write-Host "While Pandoc can generate PDFs without external engines, the quality may be limited." -ForegroundColor Yellow
    Write-Host "`nRecommended PDF engine: wkhtmltopdf (easiest to install)"
    Write-Host "Installation options:"
    Write-Host "1. Download from: https://wkhtmltopdf.org/downloads.html"
    Write-Host "2. Install with Chocolatey: choco install wkhtmltopdf"
    Write-Host "`nAlternative engines:"
    Write-Host "- XeLaTeX/pdflatex (best quality): Install MiKTeX (https://miktex.org/download)"
    Write-Host "- WeasyPrint: Install Python and run 'pip install weasyprint'"
    Write-Host "`nThe script will continue using Pandoc's built-in capabilities." -ForegroundColor Green
    Write-Host "Press Enter to continue..." -ForegroundColor Cyan
    Read-Host
}

# Check for available PDF engines
function Get-AvailablePdfEngines {
    $availableEngines = @()
    
    # Check for wkhtmltopdf (recommended for ease of installation)
    try {
        $null = & wkhtmltopdf --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $availableEngines += "wkhtmltopdf"
            Write-Host "✓ wkhtmltopdf is installed (RECOMMENDED)" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ wkhtmltopdf is not installed (RECOMMENDED OPTION)" -ForegroundColor Yellow
    }
    
    # Check for xelatex
    try {
        $null = & xelatex --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $availableEngines += "xelatex"
            Write-Host "✓ XeLaTeX is installed (best quality)" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ XeLaTeX is not installed" -ForegroundColor Yellow
    }
    
    # Check for pdflatex
    try {
        $null = & pdflatex --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $availableEngines += "pdflatex"
            Write-Host "✓ pdfLaTeX is installed" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ pdfLaTeX is not installed" -ForegroundColor Yellow
    }
    
    # Check for weasyprint
    try {
        $null = & weasyprint --version 2>&1
        if ($LASTEXITCODE -eq 0) {
            $availableEngines += "weasyprint"
            Write-Host "✓ WeasyPrint is installed" -ForegroundColor Green
        }
    } catch {
        Write-Host "✗ WeasyPrint is not installed" -ForegroundColor Yellow
    }
    
    # Always add built-in engines that don't need external dependencies
    $availableEngines += "ms"  # Built-in Pandoc engine for simple documents
    Write-Host "✓ ms (built-in Pandoc engine) is available" -ForegroundColor Green
    
    return $availableEngines
}

# Check if Pandoc is installed by trying to run a simple command
function Test-PandocInstalled {
    param (
        [string]$PandocPath
    )
    
    try {
        # Use a simple command to test if Pandoc works
        $null = & $PandocPath --version
        if ($LASTEXITCODE -eq 0) {
            Write-Host "✓ Pandoc is working correctly" -ForegroundColor Green
            return $true
        } else {
            Write-Host "✗ Pandoc command returned error code: $LASTEXITCODE" -ForegroundColor Red
            return $false
        }
    }
    catch {
        Write-Host "✗ Error running Pandoc: $_" -ForegroundColor Red
        Write-Host "Please install Pandoc from: https://pandoc.org/installing.html" -ForegroundColor Yellow
        return $false
    }
}

# Build format options based on advanced settings
function Build-FormatOptions {
    param (
        [string[]]$OutputFormats,
        [hashtable]$AdvancedOptions
    )
    
    $formatOptions = @{
        "pdf" = @{
            "outputDir" = "pdf"
            "args" = @()
        }
        "docx" = @{
            "outputDir" = "docx"
            "args" = @()
        }
        "html" = @{
            "outputDir" = "html"
            "args" = @()
        }
    }
    
    # Configure PDF options
    if ($OutputFormats -contains "pdf") {
        $formatOptions.pdf.args = @(
            "--pdf-engine=$($AdvancedOptions.PdfEngine)",
            "-V", "geometry:margin=$($AdvancedOptions.Margin)",
            "-V", "colorlinks=true",
            "-V", "linkcolor=blue",
            "-V", "urlcolor=blue",
            "-V", "toccolor=blue"
        )
        
        # Add TOC if selected
        if ($AdvancedOptions.IncludeToc) {
            $formatOptions.pdf.args += "--toc"
        }
    }
    
    # Configure DOCX options
    if ($OutputFormats -contains "docx") {
        $formatOptions.docx.args = @()
        if ($AdvancedOptions.IncludeToc) {
            $formatOptions.docx.args += "--toc"
        }
    }
    
    # Configure HTML options
    if ($OutputFormats -contains "html") {
        $formatOptions.html.args = @("--standalone")
        if ($AdvancedOptions.IncludeToc) {
            $formatOptions.html.args += "--toc"
        }
        $formatOptions.html.args += "-c"
        $formatOptions.html.args += "github-markdown.css"
    }
    
    return $formatOptions
}
