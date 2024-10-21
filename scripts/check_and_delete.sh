#!/bin/bash

# Specify the paths to the directories (change these to your absolute paths)
MEDIA_DIRECTORY="/mnt/ext-hdd/media"
TORRENT_DIRECTORY="/mnt/ext-hdd/torrent/radarr"

# Function to check and delete old directories
check_and_delete_old_dirs() {
    local dir_path="$1"

    # Check if the directory exists
    if [ -d "$dir_path" ]; then
        # Iterate over all directories in the folder
        for DIR in "$dir_path"/*; do
            # Check if it's a directory
            if [ -d "$DIR" ]; then
                # Get the directory's age in seconds
                DIR_AGE=$(($(date +%s) - $(stat -c %Y "$DIR")))

                # Check if the directory is older than 20 days (1,728,000 seconds)
                if [ "$DIR_AGE" -gt 1728000 ]; then
                    echo "The directory '$DIR' is older than 20 days and will be deleted."
                    rm -r "$DIR"  # Remove the directory and its contents
                fi
            fi
        done
    fi
}

# Check the first directory
check_and_delete_old_dirs "$MEDIA_DIRECTORY"

# Check the second directory
check_and_delete_old_dirs "$TORRENT_DIRECTORY"
