#!/bin/bash

output_file="output_colors.txt"
rm -f "$output_file"  # Delete the file if it already exists

# Traverse the primary directories
for dir in *; do
    if [ -d "$dir" ]; then
        # Write the directory name as a comment
        echo "# $dir" >> "$output_file"
        
        # List all the file extensions in the directory with the color
        for file in "$dir"/sample.*; do
            ext=".${file##*.}"  # Extract the file extension
            echo "$ext 00;33" >> "$output_file"
        done

        # Add a blank line for separation
        echo "" >> "$output_file"
    fi
done

