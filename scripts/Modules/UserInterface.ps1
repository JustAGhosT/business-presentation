# -----------------------------------------------
# User Interface Functions
# -----------------------------------------------

# Function to display welcome message
function Show-WelcomeMessage {
    Clear-Host
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "           MARKDOWN CONVERTER TOOL            " -ForegroundColor Cyan
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host "Convert Markdown files to PDF, DOCX, and HTML formats"
    Write-Host "Author: Jurie Smit"
    Write-Host "===============================================" -ForegroundColor Cyan
    Write-Host ""
}

# Function to get source directory from user
function Get-SourceDirectory {
    Write-Host "Select a folder containing Markdown files:" -ForegroundColor Yellow
    Write-Host "1. Use current directory: $PWD"
    Write-Host "2. Enter a specific path"
    Write-Host "3. Browse for folder"
    
    $choice = Read-Host "Enter your choice (1-3)"
    
    switch ($choice) {
        "1" { return $PWD.Path }
        "2" {
            $path = Read-Host "Enter the path to your Markdown files"
            if (Test-Path -Path $path) {
                return $path
            } else {
                Write-Host "Invalid path. Using current directory." -ForegroundColor Red
                return $PWD.Path
            }
        }
        "3" {
            return Get-FolderBrowserDialog
        }
        default {
            Write-Host "Invalid choice. Using current directory." -ForegroundColor Red
            return $PWD.Path
        }
    }
}

# Function to display folder browser dialog
function Get-FolderBrowserDialog {
    $folderBrowser = New-Object System.Windows.Forms.FolderBrowserDialog
    $folderBrowser.Description = "Select a folder containing Markdown files"
    $folderBrowser.RootFolder = [System.Environment+SpecialFolder]::MyComputer
    
    if ($folderBrowser.ShowDialog() -eq "OK") {
        return $folderBrowser.SelectedPath
    } else {
        Write-Host "No folder selected. Using current directory." -ForegroundColor Yellow
        return $PWD.Path
    }
}

# Function to get output formats from user
function Get-OutputFormats {
    Write-Host "`nSelect output formats:" -ForegroundColor Yellow
    Write-Host "1. PDF"
    Write-Host "2. DOCX (Word)"
    Write-Host "3. HTML"
    Write-Host "4. All formats"
    
    $choice = Read-Host "Enter your choice (1-4 or comma-separated list, e.g., 1,3)"
    
    $formats = @()
    
    if ($choice -eq "4") {
        $formats = @("pdf", "docx", "html")
    } else {
        $choices = $choice -split "," | ForEach-Object { $_.Trim() }
        
        foreach ($c in $choices) {
            switch ($c) {
                "1" { $formats += "pdf" }
                "2" { $formats += "docx" }
                "3" { $formats += "html" }
            }
        }
    }
    
    if ($formats.Count -eq 0) {
        Write-Host "No valid formats selected. Using PDF as default." -ForegroundColor Red
        $formats = @("pdf")
    }
    
    Write-Host "Selected formats: $($formats -join ", ")" -ForegroundColor Green
    return $formats
}

# Function to get recursive option from user
function Get-RecursiveOption {
    $recursive = Read-Host "`nSearch subdirectories for Markdown files? (y/n)"
    return $recursive -eq "y"
}

# Function to get advanced options from user
function Get-AdvancedOptions {
    $useAdvanced = Read-Host "`nDo you want to configure advanced options? (y/n)"
    
    if ($useAdvanced -eq "y") {
        $options = @{}
        
        # PDF Engine option
        Write-Host "`nSelect PDF engine:" -ForegroundColor Yellow
        Write-Host "1. wkhtmltopdf (recommended if installed)"
        Write-Host "2. pdflatex (LaTeX, best quality if installed)"
        Write-Host "3. xelatex (LaTeX with better Unicode support)"
        Write-Host "4. weasyprint (good CSS support if installed)"
        Write-Host "5. ms (built-in Pandoc engine, no additional installation)"
        
        $engineChoice = Read-Host "Enter your choice (1-5)"
        
        switch ($engineChoice) {
            "1" { $options["pdf-engine"] = "wkhtmltopdf" }
            "2" { $options["pdf-engine"] = "pdflatex" }
            "3" { $options["pdf-engine"] = "xelatex" }
            "4" { $options["pdf-engine"] = "weasyprint" }
            "5" { $options["pdf-engine"] = "ms" }
            default { $options["pdf-engine"] = "wkhtmltopdf" }
        }
        
        # Table of Contents option
        $tocChoice = Read-Host "`nInclude Table of Contents? (y/n)"
        $options["toc"] = $tocChoice -eq "y"
        
        # Margin options
        $customMargins = Read-Host "`nCustomize page margins? (y/n)"
        if ($customMargins -eq "y") {
            $marginValue = Read-Host "Enter margin size in mm (e.g., 20)"
            if ($marginValue -match "^\d+$") {
                $options["margin"] = "$($marginValue)mm"
            } else {
                Write-Host "Invalid margin value. Using default." -ForegroundColor Yellow
            }
        }
        
        return $options
    } else {
        # Default options
        return @{
            "pdf-engine" = "wkhtmltopdf"
            "toc" = $false
        }
    }
}
