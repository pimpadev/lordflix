#!/bin/bash

# Specify the paths to the directories (change these to your absolute paths)
MEDIA_DIRECTORY="/mnt/ext-hdd/media"
TORRENT_DIRECTORY="/mnt/ext-hdd/torrent/radarr"

# Function to check and delete old directories
check_and_delete_old_dirs() {
    local dir_path="$1"
    echo "Checking the directory: $dir_path"

    # Check if the directory exists
    if [ -d "$dir_path" ]; then
        # Counter for found directories
        DIR_FOUND=0

        # Iterate over all directories in the folder
        for DIR in "$dir_path"/*; do
            # Check if it's a directory
            if [ -d "$DIR" ]; then
                DIR_FOUND=1  # At least one directory found
                
                # Get the directory's age in seconds
                DIR_AGE=$(($(date +%s) - $(stat -c %Y "$DIR")))
                
                # Check if the directory is older than 30 days (2,592,000 seconds)
                if [ "$DIR_AGE" -gt 2592000 ]; then
                    echo "The directory '$DIR' is older than 30 days and will be deleted."
                    rm -r "$DIR"  # Remove the directory and its contents
                else
                    echo "The directory '$DIR' is less than 30 days old."
                fi
            fi
        done

        # Check if no directories were found
        if [ "$DIR_FOUND" -eq 0 ]; then
            echo "No directories found in the folder."
        fi
    else
        echo "The directory '$dir_path' does not exist."
    fi
}

# Check the first directory
check_and_delete_old_dirs "$MEDIA_DIRECTORY"

# Check the second directory
check_and_delete_old_dirs "$TORRENT_DIRECTORY"
