# -----------------------------------------------
# Markdown Converter - Requirements Installer
# Author: Jurie Smit
# Description: Installs Pandoc and PDF engines required for the Markdown Converter
# -----------------------------------------------

# Function to check if a command exists
function Test-CommandExists {
    param (
        [string]$Command
    )
    
    try {
        $null = Get-Command $Command -ErrorAction Stop
        return $true
    }
    catch {
        return $false
    }
}

# Function to display menu and get choice
function Show-Menu {
    param (
        [string]$Title = "Installation Options"
    )
    
    Clear-Host
    Write-Host "================ $Title ================" -ForegroundColor Cyan
    Write-Host ""
    Write-Host "1. Install using WinGet (Recommended for Windows 10/11)" -ForegroundColor Green
    Write-Host "2. Install using Chocolatey" -ForegroundColor Green
    Write-Host "3. Open download pages for manual installation" -ForegroundColor Yellow
    Write-Host "Q. Quit" -ForegroundColor Red
    Write-Host ""
}

# Function to install using WinGet
function Install-WithWinGet {
    if (-not (Test-CommandExists "winget")) {
        Write-Host "WinGet is not installed or not available in your system." -ForegroundColor Red
        Write-Host "WinGet comes pre-installed with Windows 10/11, but may require updates." -ForegroundColor Yellow
        Write-Host "Please visit: https://github.com/microsoft/winget-cli" -ForegroundColor Yellow
        Write-Host "Press Enter to return to the menu..."
        Read-Host
        return
    }
    
    Write-Host "Installing with WinGet..." -ForegroundColor Cyan
    
    # Install Pandoc
    Write-Host "`nInstalling Pandoc..." -ForegroundColor Yellow
    try {
        winget install --id JohnMacFarlane.Pandoc
        Write-Host "Pandoc installed successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Error installing Pandoc: $_" -ForegroundColor Red
    }
    
    # Ask which PDF engine to install
    Write-Host "`nSelect a PDF engine to install:" -ForegroundColor Cyan
    Write-Host "1. wkhtmltopdf (Recommended, easiest to use)" -ForegroundColor Green
    Write-Host "2. MiKTeX (LaTeX, best quality but larger download)" -ForegroundColor Yellow
    Write-Host "3. Both" -ForegroundColor Magenta
    Write-Host "4. None (Skip PDF engine installation)" -ForegroundColor Gray
    
    $engineChoice = Read-Host "Enter your choice (1-4)"
    
    switch ($engineChoice) {
        "1" {
            Write-Host "`nInstalling wkhtmltopdf..." -ForegroundColor Yellow
            try {
                winget install --id wkhtmltopdf.wkhtmltopdf
                Write-Host "wkhtmltopdf installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing wkhtmltopdf: $_" -ForegroundColor Red
            }
        }
        "2" {
            Write-Host "`nInstalling MiKTeX (LaTeX)..." -ForegroundColor Yellow
            Write-Host "Note: This is a large download and may take some time." -ForegroundColor Yellow
            try {
                winget install --id MiKTeX.MiKTeX
                Write-Host "MiKTeX installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing MiKTeX: $_" -ForegroundColor Red
            }
        }
        "3" {
            Write-Host "`nInstalling wkhtmltopdf..." -ForegroundColor Yellow
            try {
                winget install --id wkhtmltopdf.wkhtmltopdf
                Write-Host "wkhtmltopdf installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing wkhtmltopdf: $_" -ForegroundColor Red
            }
            
            Write-Host "`nInstalling MiKTeX (LaTeX)..." -ForegroundColor Yellow
            Write-Host "Note: This is a large download and may take some time." -ForegroundColor Yellow
            try {
                winget install --id MiKTeX.MiKTeX
                Write-Host "MiKTeX installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing MiKTeX: $_" -ForegroundColor Red
            }
        }
        "4" {
            Write-Host "`nSkipping PDF engine installation." -ForegroundColor Gray
            Write-Host "Note: You can still use the built-in Pandoc PDF engine, but quality may be limited." -ForegroundColor Yellow
        }
        default {
            Write-Host "`nInvalid choice. Skipping PDF engine installation." -ForegroundColor Red
        }
    }
    
    Write-Host "`nInstallation complete!" -ForegroundColor Green
    Write-Host "You may need to restart your PowerShell session or computer for changes to take effect." -ForegroundColor Yellow
    Write-Host "Press Enter to return to the menu..."
    Read-Host
}

# Function to install using Chocolatey
function Install-WithChocolatey {
    if (-not (Test-CommandExists "choco")) {
        Write-Host "Chocolatey is not installed." -ForegroundColor Red
        Write-Host "Would you like to install Chocolatey now? (y/n)" -ForegroundColor Yellow
        $installChoco = Read-Host
        
        if ($installChoco -eq "y") {
            try {
                Write-Host "Installing Chocolatey..." -ForegroundColor Yellow
                Set-ExecutionPolicy Bypass -Scope Process -Force
                [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
                Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
                
                Write-Host "Chocolatey installed successfully!" -ForegroundColor Green
                Write-Host "Restarting script to use Chocolatey..." -ForegroundColor Yellow
                Start-Sleep -Seconds 2
                & $PSCommandPath
                exit
            }
            catch {
                Write-Host "Error installing Chocolatey: $_" -ForegroundColor Red
                Write-Host "Please visit https://chocolatey.org/install for manual installation instructions." -ForegroundColor Yellow
                Write-Host "Press Enter to return to the menu..."
                Read-Host
                return
            }
        }
        else {
            Write-Host "Returning to menu..." -ForegroundColor Yellow
            return
        }
    }
    
    Write-Host "Installing with Chocolatey..." -ForegroundColor Cyan
    
    # Install Pandoc
    Write-Host "`nInstalling Pandoc..." -ForegroundColor Yellow
    try {
        choco install pandoc -y
        Write-Host "Pandoc installed successfully!" -ForegroundColor Green
    }
    catch {
        Write-Host "Error installing Pandoc: $_" -ForegroundColor Red
    }
    
    # Ask which PDF engine to install
    Write-Host "`nSelect a PDF engine to install:" -ForegroundColor Cyan
    Write-Host "1. wkhtmltopdf (Recommended, easiest to use)" -ForegroundColor Green
    Write-Host "2. MiKTeX (LaTeX, best quality but larger download)" -ForegroundColor Yellow
    Write-Host "3. Both" -ForegroundColor Magenta
    Write-Host "4. None (Skip PDF engine installation)" -ForegroundColor Gray
    
    $engineChoice = Read-Host "Enter your choice (1-4)"
    
    switch ($engineChoice) {
        "1" {
            Write-Host "`nInstalling wkhtmltopdf..." -ForegroundColor Yellow
            try {
                choco install wkhtmltopdf -y
                Write-Host "wkhtmltopdf installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing wkhtmltopdf: $_" -ForegroundColor Red
            }
        }
        "2" {
            Write-Host "`nInstalling MiKTeX (LaTeX)..." -ForegroundColor Yellow
            Write-Host "Note: This is a large download and may take some time." -ForegroundColor Yellow
            try {
                choco install miktex -y
                Write-Host "MiKTeX installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing MiKTeX: $_" -ForegroundColor Red
            }
        }
        "3" {
            Write-Host "`nInstalling wkhtmltopdf..." -ForegroundColor Yellow
            try {
                choco install wkhtmltopdf -y
                Write-Host "wkhtmltopdf installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing wkhtmltopdf: $_" -ForegroundColor Red
            }
            
            Write-Host "`nInstalling MiKTeX (LaTeX)..." -ForegroundColor Yellow
            Write-Host "Note: This is a large download and may take some time." -ForegroundColor Yellow
            try {
                choco install miktex -y
                Write-Host "MiKTeX installed successfully!" -ForegroundColor Green
            }
            catch {
                Write-Host "Error installing MiKTeX: $_" -ForegroundColor Red
            }
        }
        "4" {
            Write-Host "`nSkipping PDF engine installation." -ForegroundColor Gray
            Write-Host "Note: You can still use the built-in Pandoc PDF engine, but quality may be limited." -ForegroundColor Yellow
        }
        default {
            Write-Host "`nInvalid choice. Skipping PDF engine installation." -ForegroundColor Red
        }
    }
    
    Write-Host "`nInstallation complete!" -ForegroundColor Green
    Write-Host "You may need to restart your PowerShell session or computer for changes to take effect." -ForegroundColor Yellow
    Write-Host "Press Enter to return to the menu..."
    Read-Host
}

# Function to open download pages for manual installation
function Open-DownloadPages {
    Write-Host "Opening download pages in your default browser..." -ForegroundColor Cyan
    
    Write-Host "`nOpening Pandoc download page..." -ForegroundColor Yellow
    Start-Process "https://pandoc.org/installing.html"
    
    Write-Host "Opening wkhtmltopdf download page..." -ForegroundColor Yellow
    Start-Process "https://wkhtmltopdf.org/downloads.html"
    
    Write-Host "Opening MiKTeX download page..." -ForegroundColor Yellow
    Start-Process "https://miktex.org/download"
    
    Write-Host "`nPlease download and install the required software manually." -ForegroundColor Yellow
    Write-Host "Press Enter to return to the menu..."
    Read-Host
}

# Main script
$exit = $false
while (-not $exit) {
    Show-Menu
    $choice = Read-Host "Enter your choice"
    
    switch ($choice) {
        "1" { Install-WithWinGet }
        "2" { Install-WithChocolatey }
        "3" { Open-DownloadPages }
        "q" { $exit = $true }
        "Q" { $exit = $true }
        default { 
            Write-Host "Invalid choice. Press Enter to try again..." -ForegroundColor Red
            Read-Host
        }
    }
}

Write-Host "`nThank you for using the Markdown Converter Installer!" -ForegroundColor Cyan
Write-Host "You can now run MarkdownConverter.ps1 to convert your Markdown files." -ForegroundColor Green
