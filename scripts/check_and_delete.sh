#!/bin/bash

# Specify the paths to the directories (change these to your absolute paths)
MEDIA_DIRECTORY="/mnt/ext-hdd/media"

# Function to check and delete old directories
check_and_delete_old_dirs() {
    local dir_path="$1"
    local deleted_any=false

    # Get the current date in the format [YYYY-MM-DD]
    current_date=$(date +"[%Y-%m-%d]")

    # Check if the directory exists
    if [ -d "$dir_path" ]; then
        # Iterate over all directories in the folder
        for DIR in "$dir_path"/*; do
            # Check if it's a directory
            if [ -d "$DIR" ]; then
                # Get the directory's age in seconds
                DIR_AGE=$(($(date +%s) - $(stat -c %Y "$DIR")))

                # Check if the directory is older than 15 days (1,296,000 seconds)
                if [ "$DIR_AGE" -gt 1296000 ]; then
                    echo "$current_date The directory '$DIR' is older than 15 days and will be deleted."
                    rm -r "$DIR"  # Remove the directory and its contents
                    deleted_any=true
                fi
            fi
        done

        # If no directories were deleted, print a message
        if [ "$deleted_any" = false ]; then
            echo "$current_date No directories were deleted."
        fi
    else
        echo "$current_date Directory '$dir_path' does not exist."
    fi
}

# Check the first directory
check_and_delete_old_dirs "$MEDIA_DIRECTORY"
