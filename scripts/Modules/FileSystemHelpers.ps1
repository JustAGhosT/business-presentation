# -----------------------------------------------
# File System Helper Functions
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

# Function to get Markdown files from a directory
function Get-MarkdownFiles {
    param (
        [string]$SourceDirectory,
        [bool]$Recursive
    )
    
    $searchOption = if ($Recursive) { "Recurse" } else { "TopDirectoryOnly" }
    
    return Get-ChildItem -Path $SourceDirectory -Filter "*.md" -Recurse:$Recursive
}

# Function to create output directory if it doesn't exist
function New-OutputDirectory {
    param (
        [string]$Path
    )
    
    if (-not (Test-Path -Path $Path)) {
        New-Item -Path $Path -ItemType Directory | Out-Null
    }
    
    return $Path
}

# Function to write log messages
function Write-Log {
    param (
        [string]$Message,
        [string]$Level = "INFO"
    )
    
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "[$timestamp] [$Level] $Message"
    
    switch ($Level) {
        "INFO" { Write-Host $logMessage -ForegroundColor White }
        "WARNING" { Write-Host $logMessage -ForegroundColor Yellow }
        "ERROR" { Write-Host $logMessage -ForegroundColor Red }
        "SUCCESS" { Write-Host $logMessage -ForegroundColor Green }
        default { Write-Host $logMessage }
    }
}

# Configure recursive search
function Configure-RecursiveSearch {
    Write-Host "`nSearch subdirectories for Markdown files? (y/n)"
    $recursiveChoice = Read-Host
    return ($recursiveChoice -eq "y")
}

# Select directory with simplified options
function Select-Directory {
    $currentDir = (Get-Location).Path
    
    Write-Host "Select a folder containing Markdown files:`n"
    Write-Host "1. Use current directory: $currentDir"
    Write-Host "2. Enter a specific path manually"
    Write-Host "3. Select a parent folder and browse from there"
    
    $choice = Read-Host "`nEnter your choice (1-3)"
    
    switch ($choice) {
        "1" {
            return $currentDir
        }
        "2" {
            # Manual path entry
            $enteredPath = Read-Host "`nEnter the full path to the directory (e.g., C:\Documents\MarkdownFiles)"
            
            if (Test-Path -Path $enteredPath -PathType Container) {
                Write-Host "Selected directory: $enteredPath" -ForegroundColor Green
                return $enteredPath
            }
            else {
                Write-Host "Invalid path or directory does not exist. Using current directory." -ForegroundColor Yellow
                return $currentDir
            }
        }
        "3" {
            return Start-FolderBrowser -StartPath $currentDir
        }
        default {
            Write-Host "Invalid choice. Using current directory." -ForegroundColor Yellow
            return $currentDir
        }
    }
}

# Folder browser implementation
function Start-FolderBrowser {
    param (
        [string]$StartPath = (Get-Location).Path
    )
    
    # Common parent folders for quick selection
    $commonFolders = @(
        "C:\",
        "C:\Users\$env:USERNAME",
        "C:\Users\$env:USERNAME\Documents",
        "C:\Users\$env:USERNAME\Desktop",
        $StartPath
    )
    
    Write-Host "`nSelect a starting folder:" -ForegroundColor Cyan
    for ($i = 0; $i -lt $commonFolders.Count; $i++) {
        Write-Host "$($i+1). $($commonFolders[$i])"
    }
    
    $startChoice = Read-Host "`nEnter number (1-$($commonFolders.Count))"
    $currentFolder = $StartPath
    
    if ($startChoice -match '^\d+$' -and [int]$startChoice -ge 1 -and [int]$startChoice -le $commonFolders.Count) {
        $currentFolder = $commonFolders[[int]$startChoice - 1]
    }
    else {
        Write-Host "Invalid selection. Using current directory." -ForegroundColor Yellow
    }
    
    # Simple folder navigation
    while ($true) {
        Clear-Host
        Write-Host "FOLDER BROWSER" -ForegroundColor Cyan
        Write-Host "=============" -ForegroundColor Cyan
        Write-Host "Current location: $currentFolder" -ForegroundColor Yellow
        Write-Host ""
        
        # Get immediate subfolders only (no recursion)
        try {
            $subfolders = Get-ChildItem -Path $currentFolder -Directory -ErrorAction Stop
            
            # Display options
            Write-Host "OPTIONS:" -ForegroundColor Cyan
            Write-Host "0. SELECT THIS FOLDER" -ForegroundColor Green
            Write-Host "U. Go up one level" -ForegroundColor Magenta
            Write-Host ""
            Write-Host "SUBFOLDERS:" -ForegroundColor Cyan
            
            if ($subfolders.Count -eq 0) {
                Write-Host "  (No subfolders in this location)" -ForegroundColor Gray
            }
            else {
                # Display folders with pagination
                $pageSize = 15
                $totalPages = [Math]::Ceiling($subfolders.Count / $pageSize)
                $currentPage = 1
                
                # Display folders for current page
                $startIndex = 0
                $endIndex = [Math]::Min($pageSize - 1, $subfolders.Count - 1)
                
                for ($i = $startIndex; $i -le $endIndex; $i++) {
                    $folderNumber = $i + 1
                    Write-Host "$folderNumber. $($subfolders[$i].Name)"
                }
                
                if ($totalPages -gt 1) {
                    Write-Host "`nPage 1 of $totalPages (use N for next page)" -ForegroundColor Blue
                }
            }
            
            $choice = Read-Host "`nEnter your choice"
            
            # Process choice
            if ($choice -eq "0") {
                # Select current folder
                Write-Host "Selected directory: $currentFolder" -ForegroundColor Green
                return $currentFolder
            }
            elseif ($choice -eq "U" -or $choice -eq "u") {
                # Go up one level
                $parent = Split-Path -Path $currentFolder -Parent
                if ($parent) {
                    $currentFolder = $parent
                }
                else {
                    Write-Host "Already at root level." -ForegroundColor Yellow
                    Read-Host "Press Enter to continue"
                }
            }
            elseif ($choice -eq "N" -or $choice -eq "n") {
                if ($totalPages -gt 1 -and $currentPage -lt $totalPages) {
                    $currentPage++
                    # Show next page of folders
                    # (Implementation details omitted for brevity)
                }
                else {
                    Write-Host "No more pages or pagination not applicable." -ForegroundColor Yellow
                    Read-Host "Press Enter to continue"
                }
            }
            elseif ($choice -match '^\d+$') {
                # Navigate to selected folder
                $folderIndex = [int]$choice - 1
                if ($folderIndex -ge 0 -and $folderIndex -lt $subfolders.Count) {
                    $currentFolder = $subfolders[$folderIndex].FullName
                }
                else {
                    Write-Host "Invalid folder number." -ForegroundColor Yellow
                    Read-Host "Press Enter to continue"
                }
            }
            else {
                Write-Host "Invalid choice." -ForegroundColor Yellow
                Read-Host "Press Enter to continue"
            }
        }
        catch {
            Write-Host "Error accessing folder: $_" -ForegroundColor Red
            Write-Host "Returning to parent folder..." -ForegroundColor Yellow
            $parent = Split-Path -Path $currentFolder -Parent
            if ($parent) {
                $currentFolder = $parent
            }
            else {
                Write-Host "Cannot access any folders. Using current directory." -ForegroundColor Red
                return $StartPath
            }
            Read-Host "Press Enter to continue"
        }
    }
}
