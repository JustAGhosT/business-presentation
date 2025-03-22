# Markdown Converter Quick Start Guide

This guide will help you quickly get started with the Markdown Converter tool.

## Step 1: Install Required Software

### Option A: Quick Installation with Package Managers

#### Using WinGet (Windows Package Manager - built into Windows 10/11)

Open PowerShell or Command Prompt and run:

```powershell
# Install both Pandoc and wkhtmltopdf in one command
winget install --id JohnMacFarlane.Pandoc && winget install --id wkhtmltopdf.wkhtmltopdf
```

#### Using Chocolatey

If you have [Chocolatey](https://chocolatey.org/install) installed:

```powershell
# Install both Pandoc and wkhtmltopdf in one command
choco install pandoc wkhtmltopdf -y
```

### Option B: Manual Installation

1. **Install Pandoc**:
   - Download from [pandoc.org/installing.html](https://pandoc.org/installing.html)
   - Run the installer and follow the prompts

2. **Install wkhtmltopdf** (recommended PDF engine):
   - Download from [wkhtmltopdf.org/downloads.html](https://wkhtmltopdf.org/downloads.html)
   - Run the installer and follow the prompts

## Step 2: Run the Converter

1. Right-click on `MarkdownConverter.ps1` and select "Run with PowerShell"
2. If you see a security warning, press "R" to run the script

## Step 3: Convert Your Files

1. **Select a folder** containing your Markdown files:
   - Option 1: Use the current directory
   - Option 2: Enter a specific path
   - Option 3: Browse for a folder

2. **Choose output formats**:
   - Enter "1" for PDF
   - Enter "2" for DOCX (Word)
   - Enter "3" for HTML
   - Enter "4" for all formats
   - You can also combine formats (e.g., "1,3" for PDF and HTML)

3. **Choose whether to search subdirectories**:
   - Enter "y" to include Markdown files in subfolders
   - Enter "n" to only convert files in the main folder

4. **Configure advanced options** (optional):
   - Enter "y" to configure advanced options
   - Enter "n" to use default settings

5. **Wait for conversion to complete**:
   - The script will show progress as it converts each file
   - When finished, you'll see a summary of successful and failed conversions

6. **Find your converted files**:
   - A new folder named "markdown_output" will be created in your selected directory
   - Inside this folder, you'll find subfolders for each output format (pdf, docx, html)

## Troubleshooting

If you see an error about a missing PDF engine:

1. In the advanced options, select "ms" as your PDF engine (built-in)
2. For better quality, install wkhtmltopdf as described in Step 1

## Need More Help?

See the full documentation in the README.md file or refer to the PDF Engine Installation Guide in the Documentation folder.
