#!/bin/bash

# -----------------------------------------------
# Markdown to PDF Conversion Script
# Author: Jurie Smit
# Description: Converts all Markdown files in a selected folder to PDF
# -----------------------------------------------

# Text formatting
BOLD='\033[1m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to display script header
display_header() {
  echo -e "${BOLD}${BLUE}==============================================${NC}"
  echo -e "${BOLD}${BLUE}  Markdown to PDF Conversion Tool${NC}"
  echo -e "${BOLD}${BLUE}  Created by Jurie Smit${NC}"
  echo -e "${BOLD}${BLUE}==============================================${NC}"
  echo
}

# Function to check if pandoc is installed
check_dependencies() {
  echo -e "${YELLOW}Checking dependencies...${NC}"
  
  if ! command -v pandoc &> /dev/null; then
    echo -e "${RED}Error: pandoc is not installed.${NC}"
    echo -e "Please install pandoc using one of these commands:"
    echo -e "  - Ubuntu/Debian: ${BOLD}sudo apt-get install pandoc texlive-latex-base texlive-fonts-recommended${NC}"
    echo -e "  - macOS: ${BOLD}brew install pandoc${NC}"
    echo -e "  - Windows: Visit https://pandoc.org/installing.html"
    exit 1
  fi
  
  echo -e "${GREEN}✓ Pandoc is installed.${NC}"
  echo
}

# Function to browse folders
browse_folders() {
  local current_dir="$1"
  local selected_dir=""
  
  while true; do
    clear
    display_header
    
    echo -e "${BOLD}Current directory:${NC} $current_dir"
    echo -e "${BOLD}${YELLOW}Select a folder to convert Markdown files or navigate:${NC}"
    echo
    
    # List directories with numbers
    local dirs=()
    local i=1
    
    # Add special navigation options
    echo -e "${BOLD}0.${NC} [Select current directory]"
    
    if [[ "$current_dir" != "/" ]]; then
      echo -e "${BOLD}1.${NC} [Go up one level]"
      i=2
    else
      i=1
    fi
    
    # List subdirectories
    local j=0
    while IFS= read -r dir; do
      if [[ -d "$dir" && ! "$dir" =~ /\..* ]]; then
        dirs[$j]="$dir"
        echo -e "${BOLD}$i.${NC} $(basename "$dir")/"
        i=$((i+1))
        j=$((j+1))
      fi
    done < <(find "$current_dir" -maxdepth 1 -type d | sort)
    
    echo
    read -p "Enter your choice (or 'q' to quit): " choice
    
    if [[ "$choice" == "q" ]]; then
      return 1
    elif [[ "$choice" == "0" ]]; then
      selected_dir="$current_dir"
      break
    elif [[ "$choice" == "1" && "$current_dir" != "/" ]]; then
      current_dir="$(dirname "$current_dir")"
    elif [[ "$choice" =~ ^[0-9]+$ && "$choice" -ge 2 && "$choice" -lt $i ]]; then
      local index=$((choice-2))
      if [[ $index -ge 0 && $index -lt ${#dirs[@]} ]]; then
        current_dir="${dirs[$index]}"
      fi
    else
      echo -e "${RED}Invalid choice. Press Enter to continue...${NC}"
      read
    fi
  done
  
  echo "$selected_dir"
}

# Function to count markdown files in a directory
count_markdown_files() {
  local dir="$1"
  find "$dir" -maxdepth 1 -type f -name "*.md" | wc -l
}

# Function to convert markdown to PDF
convert_markdown_to_pdf() {
  local input_dir="$1"
  local output_dir="$input_dir/pdf_output"
  local success_count=0
  local error_count=0
  local total_files=0
  
  # Create output directory if it doesn't exist
  mkdir -p "$output_dir"
  
  # Get total number of markdown files
  total_files=$(count_markdown_files "$input_dir")
  
  if [ "$total_files" -eq 0 ]; then
    echo -e "${YELLOW}No Markdown files found in the selected directory.${NC}"
    return 1
  fi
  
  echo -e "${BLUE}Found $total_files Markdown files to convert.${NC}"
  echo
  
  # Process each markdown file
  local current=0
  find "$input_dir" -maxdepth 1 -type f -name "*.md" | while read -r file; do
    current=$((current+1))
    filename=$(basename "$file" .md)
    output_file="$output_dir/${filename}.pdf"
    
    echo -e "${YELLOW}[$current/$total_files] Converting:${NC} $filename.md"
    
    # Run pandoc with error handling
    if pandoc "$file" \
        -o "$output_file" \
        --pdf-engine=xelatex \
        -V geometry:margin=1in \
        -V colorlinks=true \
        -V linkcolor=blue \
        -V urlcolor=blue \
        -V toccolor=blue \
        --toc 2>/tmp/pandoc_error.log; then
      echo -e "${GREEN}✓ Success:${NC} Created $output_file"
      success_count=$((success_count+1))
    else
      error_message=$(cat /tmp/pandoc_error.log)
      echo -e "${RED}✗ Error:${NC} Failed to convert $filename.md"
      echo -e "${RED}  Error details:${NC} $error_message"
      error_count=$((error_count+1))
    fi
  done
  
  echo
  echo -e "${BLUE}Conversion Summary:${NC}"
  echo -e "${GREEN}✓ Successfully converted: $success_count files${NC}"
  if [ "$error_count" -gt 0 ]; then
    echo -e "${RED}✗ Failed to convert: $error_count files${NC}"
  fi
  echo -e "${BOLD}Output directory:${NC} $output_dir"
  
  return 0
}

# Main function
main() {
  display_header
  check_dependencies
  
  # Start from current directory
  current_dir=$(pwd)
  
  # Browse folders
  selected_dir=$(browse_folders "$current_dir")
  
  if [ $? -eq 1 ]; then
    echo -e "${YELLOW}Operation cancelled by user.${NC}"
    exit 0
  fi
  
  echo
  echo -e "${BLUE}Selected directory:${NC} $selected_dir"
  echo
  
  # Convert markdown files
  convert_markdown_to_pdf "$selected_dir"
  
  echo
  echo -e "${GREEN}Conversion process completed.${NC}"
  echo
  
  # Ask if user wants to open the output directory
  read -p "Do you want to open the output directory? (y/n): " open_dir
  if [[ "$open_dir" =~ ^[Yy]$ ]]; then
    if [[ "$OSTYPE" == "darwin"* ]]; then
      # macOS
      open "$selected_dir/pdf_output"
    elif [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" ]]; then
      # Windows
      start "$selected_dir/pdf_output"
    else
      # Linux
      if command -v xdg-open &> /dev/null; then
        xdg-open "$selected_dir/pdf_output"
      else
        echo -e "${YELLOW}Cannot open directory automatically. Please navigate to:${NC}"
        echo "$selected_dir/pdf_output"
      fi
    fi
  fi
}

# Run the main function
main
