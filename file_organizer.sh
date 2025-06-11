#!/bin/bash

create_directories() {
  mkdir -p Documents Images Videos Music Archives
}

organize_files() {
  for file in *.doc *.docx *.txt *.pdf *.odt; do
    if [ -f "$file" ]; then
      mv "$file" Documents/
    fi
  done
  
  for file in *.jpg *.jpeg *.gif *.png; do
    if [ -f "$file" ]; then
      mv "$file" Images/
    fi
  done
  
  for file in *.mp4 *.avi *.mkv *.mov; do
    if [ -f "$file" ]; then
      mv "$file" Videos/
    fi
  done
  
  for file in *.mp3 *.wav *.ogg *.flac; do
    if [ -f "$file" ]; then
      mv "$file" Music/
    fi
  done
  
  for file in *.zip *.tar.gz *.rar; do
    if [ -f "$file" ]; then
      mv "$file" Archives/
    fi
  done
  
  echo "File organization complete!"
}

find_file() {
  echo "Enter the filename or pattern to search for:"
  read search_pattern
  
  found_files=$(find . -name "*$search_pattern*" -type f)
  
  if [ -z "$found_files" ]; then
    echo "No files found matching the pattern: $search_pattern"
  else
    echo "Found files:"
    echo "$found_files"
    
    for file in $found_files; do
      echo "File details for: $file"
      echo "Size: $(du -h "$file" | cut -f1)"
      echo "Type: $(file -b "$file")"
      echo "Last modified: $(stat -f "%Sm" -t "%Y-%m-%d %H:%M:%S" "$file")"
    done
  fi
}

create_custom_directory() {
  echo "Enter the filename or pattern to search:"
  read search_pattern
  
  found_files=$(find . -name "*$search_pattern*" -type f)
  
  if [ -z "$found_files" ]; then
    echo "No files found matching the pattern: $search_pattern"
  else
    echo "Found files:"
    echo "$found_files"
    
    for file in $found_files; do
      filename=$(basename "$file")
      dir_name=${filename%.*}
      
      mkdir -p "$dir_name"
      
      mv "$file" "$dir_name/"
      echo "File $file moved to directory $dir_name."
    done
  fi
}

remove_files() {
  echo "Enter the filename or pattern to search and remove:"
  read search_pattern
  
  found_files=$(find . -name "*$search_pattern*" -type f)
  
  if [ -z "$found_files" ]; then
    echo "No files found matching the pattern: $search_pattern"
  else
    echo "Found files:"
    echo "$found_files"
    
    for file in $found_files; do
      rm "$file"
      echo "File $file removed."
    done
  fi
}

main_menu() {
  clear
  echo "====== File Organizer Menu ======"
  echo "📂 1. Organize all files by type"
  echo "📁 2. Create custom directory and move files"
  echo "🔍 3. Find and view file details"
  echo "🗑️ 4. Remove files"
  echo "🚪 5. Exit"
  echo "==============================="
  echo "🔢 Enter your choice (1-5):"
  read choice
  
  case $choice in
    1) create_directories && organize_files ;;
    2) create_custom_directory ;;
    3) find_file ;;
    4) remove_files ;;
    5) echo "Exiting..." && exit 0 ;;
    *) echo "Invalid choice. Please try again." ;;
  esac
  
  echo "Press Enter to continue..."
  read
  main_menu
}

main_menu