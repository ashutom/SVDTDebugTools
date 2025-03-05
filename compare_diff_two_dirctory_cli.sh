#!/bin/bash

dir1="$1"
dir2="$2"

if [ -z "$dir1" ] || [ -z "$dir2" ]; then
  echo "Usage: $0 <directory1> <directory2>"
  exit 1
fi

if [ ! -d "$dir1" ] || [ ! -d "$dir2" ]; then
  echo "Error: Both arguments must be directories."
  exit 1
fi

find "$dir1" -type f -print0 | while IFS= read -r -d $'\0' file1; do
  file2="${file1/$dir1/$dir2}"
  if [ -f "$file2" ]; then
    #echo "Comparing: $file1 and $file2"
    output="$(diff -q "$file1" "$file2")"
    if [ -n "$output" ]; then
    #else
        echo "$file1 and $file2 differ : "
        output="$(diff "$file1" "$file2")"
        echo "     $output"
        echo
        echo
    fi
    output=""
    #diff "$file1" "$file2"
  else
    echo "Warning: $file1 exists in $dir1 but not in $dir2"
  fi
done

find "$dir2" -type f -print0 | while IFS= read -r -d $'\0' file2; do
    file1="${file2/$dir2/$dir1}"
    if [ ! -f "$file1" ]; then
        echo "Warning: $file2 exists in $dir2 but not in $dir1"
    fi
done
