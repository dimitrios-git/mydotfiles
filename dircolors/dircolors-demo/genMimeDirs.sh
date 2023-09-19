#!/bin/bash

while IFS= read -r line; do
    # Check if line contains a /
    if echo "$line" | grep -q "/"; then
        mime_type=$(echo "$line" | awk '{print $1}')
        extensions=$(echo "$line" | awk '{$1=""; print $0}' | tr -s ' ' | sed 's/^ //')

        primary_type=$(echo "$mime_type" | cut -d'/' -f1)

        echo "Processing MIME type: $mime_type"

        # Create the primary directory if it doesn't exist
        if [ ! -d "$primary_type" ]; then
            echo "Creating directory: $primary_type"
            mkdir -p "$primary_type"
        fi

        # Touch each of the extensions inside the primary directory
        for ext in $extensions; do
            echo "Creating file: $primary_type/sample.$ext"
            touch "$primary_type/sample.$ext"
        done
    fi
done < ./mime.types

