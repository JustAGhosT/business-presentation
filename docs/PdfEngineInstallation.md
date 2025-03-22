# PDF Engine Installation Guide

This guide will help you install the necessary PDF engines to get the best results from the Markdown Converter.

## Quick Installation with Package Managers

### Using WinGet (Windows Package Manager)

WinGet is built into Windows 10/11 and provides an easy way to install software:

```powershell
# Install Pandoc
winget install --id JohnMacFarlane.Pandoc

# Install wkhtmltopdf (recommended PDF engine)
winget install --id wkhtmltopdf.wkhtmltopdf

# Install MiKTeX (for LaTeX/pdflatex/xelatex)
winget install --id MiKTeX.MiKTeX
```

### Using Chocolatey

If you have [Chocolatey](https://chocolatey.org/install) installed:

```powershell
# Install Pandoc
choco install pandoc -y

# Install wkhtmltopdf (recommended PDF engine)
choco install wkhtmltopdf -y

# Install MiKTeX (for LaTeX/pdflatex/xelatex)
choco install miktex -y
```

## Recommended Option: wkhtmltopdf

wkhtmltopdf is the easiest PDF engine to install and provides good quality output.

### Manual Installation Steps:

1. **Download the installer**:
   - Visit [wkhtmltopdf.org/downloads.html](https://wkhtmltopdf.org/downloads.html)
   - Download the appropriate installer for your Windows version (32-bit or 64-bit)

2. **Run the installer**:
   - Double-click the downloaded file
   - Follow the installation wizard
   - Make sure to select "Add to PATH" if that option is available

3. **Verify installation**:
   - Open a new PowerShell or Command Prompt window
   - Run `wkhtmltopdf --version`
   - If you see version information, the installation was successful

## Best Quality Option: LaTeX (pdflatex/xelatex)

LaTeX produces the highest quality PDFs, especially for documents with complex formatting, mathematics, or academic content.

### Manual Installation Steps:

1. **Install MiKTeX** (recommended LaTeX distribution for Windows):
   - Visit [miktex.org/download](https://miktex.org/download)
   - Download the installer
   - Run the installer and follow the wizard
   - Choose "Install missing packages on the fly" when prompted

2. **Verify installation**:
   - Open a new PowerShell or Command Prompt window
   - Run `pdflatex --version` or `xelatex --version`
   - If you see version information, the installation was successful

## Alternative: WeasyPrint

WeasyPrint is a good option if you need excellent CSS support.

### Installation Steps:

1. **Install Python** (if not already installed):
   - Download from [python.org](https://www.python.org/downloads/)
   - Make sure to check "Add Python to PATH" during installation
   - Or use WinGet: `winget install --id Python.Python`
   - Or use Chocolatey: `choco install python -y`

2. **Install WeasyPrint via pip**:
   - Open a PowerShell or Command Prompt window
   - Run `pip install weasyprint`

3. **Verify installation**:
   - Run `weasyprint --version`
   - If you see version information, the installation was successful

## Troubleshooting

### Common Issues:

1. **"Command not found" errors**:
   - Make sure the installation added the program to your PATH
   - You may need to restart your computer after installation
   - Try opening a new terminal window

2. **"Missing dependencies" errors with LaTeX**:
   - LaTeX may need to download additional packages during first use
   - Make sure you have internet access
   - Run a simple test conversion to trigger package installation

3. **wkhtmltopdf fails to create PDF**:
   - Ensure you have the latest version
   - Try running with administrator privileges

### Still Having Issues?

If you continue to experience problems, try using the built-in Pandoc PDF engine by selecting "ms" in the advanced options. While it may not produce the highest quality output, it requires no additional installation.
