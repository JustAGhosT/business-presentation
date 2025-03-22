# Fucking No Bullshit Markdown to PDF Converter

This is a straightforward PowerShell tool that converts your Markdown files to PDF, DOCX, and HTML without any bullshit. Because you shouldn't have to waste hours just to convert a damn Markdown file.

## What This Does

- Converts Markdown (.md) files to PDF, DOCX, and HTML
- Handles multiple files at once
- Searches subdirectories if you want
- Uses Pandoc under the hood (because it actually works)
- No complicated setup or dependencies beyond what's absolutely necessary

## Quick Start

1. Download all files
2. Run `Install-Requirements.ps1` to get the necessary tools
3. Run `MarkdownConverter.ps1`
4. Follow the prompts
5. Get your damn PDFs

## Alternatives (Because Sometimes PowerShell Isn't the Answer)

If this script doesn't work for you or you just want something simpler:

### Online Converters (No Installation)

- [Markdown to PDF](https://www.markdowntopdf.com/) - Simple web interface, drag and drop
- [Dillinger](https://dillinger.io/) - Edit and export to PDF in browser
- [HackMD](https://hackmd.io/) - Collaborative markdown editor with PDF export

### Desktop Applications

- [Typora](https://typora.io/) - Markdown editor that can export to PDF directly
- [VS Code + Markdown PDF extension](https://marketplace.visualstudio.com/items?itemName=yzane.markdown-pdf) - If you're already using VS Code
- [Obsidian](https://obsidian.md/) - Knowledge base that uses Markdown files and can export to PDF

### Command Line (For the Terminal Junkies)

```bash
# If you have Node.js:
npm install -g md-to-pdf
md-to-pdf your-file.md

# If you have Python:
pip install grip
grip your-file.md --export your-file.pdf

# If you have Pandoc directly:
pandoc -s your-file.md -o your-file.pdf
```

## Why This Exists

Because converting Markdown to PDF shouldn't require a computer science degree or hours of your life. This script exists to solve one problem well: turning your Markdown into readable documents without the headache.

## Requirements

- Windows 10/11
- PowerShell 5.1 or higher
- Internet connection (for the installer)
- About 2 minutes of your time (not hours)

## License

Do whatever the fuck you want with it. Seriously.
