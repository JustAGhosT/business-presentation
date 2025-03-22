# -----------------------------------------------
# Markdown Converter
# Author: Jurie Smit
# Description: Converts Markdown files to PDF, DOCX, and HTML formats
# -----------------------------------------------

# Import modules
$ScriptPath = Split-Path -Parent $MyInvocation.MyCommand.Path
$ModulesPath = Join-Path -Path $ScriptPath -ChildPath "Modules"

# Check if Modules folder exists, create if not
if (-not (Test-Path -Path $ModulesPath)) {
    New-Item -Path $ModulesPath -ItemType Directory
}

# Import modules
$ModuleFiles = @(
    "FileSystemHelpers.ps1",
    "UserInterface.ps1",
    "PandocHelpers.ps1",
    "ConversionHelpers.ps1"
)

foreach ($module in $ModuleFiles) {
    $modulePath = Join-Path -Path $ModulesPath -ChildPath $module
    if (Test-Path -Path $modulePath) {
        . $modulePath
    } else {
        Write-Host "Module $module not found. Please ensure all module files are in the Modules folder." -ForegroundColor Red
        exit
    }
}

# Check if Pandoc is installed
if (-not (Test-CommandExists "pandoc")) {
    Write-Host "Pandoc is not installed. Please install Pandoc before using this script." -ForegroundColor Red
    Write-Host "You can run Install-Requirements.ps1 to install Pandoc and PDF engines." -ForegroundColor Yellow
    
    $installNow = Read-Host "Would you like to run the installer now? (y/n)"
    if ($installNow -eq "y") {
        $installerPath = Join-Path -Path $ScriptPath -ChildPath "Install-Requirements.ps1"
        if (Test-Path -Path $installerPath) {
            & $installerPath
            # Exit after running installer
            exit
        } else {
            Write-Host "Installer script not found. Please download it from the repository." -ForegroundColor Red
            exit
        }
    } else {
        exit
    }
}

# Display welcome message
Show-WelcomeMessage

# Get source directory
$sourceDir = Get-SourceDirectory

# Select output formats
$formats = Get-OutputFormats

# Ask if user wants to search subdirectories
$recursive = Get-RecursiveOption

# Ask if user wants to configure advanced options
$advancedOptions = Get-AdvancedOptions

# Get Markdown files
$markdownFiles = Get-MarkdownFiles -SourceDirectory $sourceDir -Recursive $recursive

if ($markdownFiles.Count -eq 0) {
    Write-Host "No Markdown files found in the specified directory." -ForegroundColor Red
    exit
}

Write-Host "`nFound $($markdownFiles.Count) Markdown files to convert." -ForegroundColor Cyan

# Convert files
$outputDir = Convert-MarkdownFiles -Files $markdownFiles -Formats $formats -OutputDirectory $sourceDir -Options $advancedOptions

# Show completion message
Write-Host "`nConversion complete! Output files are located in: $outputDir" -ForegroundColor Green
Write-Host "Press any key to exit..."
$null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
