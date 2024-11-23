#!/bin/bash

# Parameter %F (content path)
content_path="$1"

# Verify if there are .rar files downloaded
find "$content_path" -type f -iname "*.rar" | while read rar_file; do
    # Unrar the file
    unrar x "$rar_file" "$content_path"

    # Check if decompression was successful
    if [ $? -eq 0 ]; then
        echo "Successful decompression: $rar_file"
    else
        echo "Error while decompression file: $rar_file"
    fi
done
