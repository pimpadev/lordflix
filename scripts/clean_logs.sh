#!/bin/bash

# Specify the path to the logs directory (change this to your absolute path)
LOG_DIRECTORY="/home/user/path/to/logs"

# Verify the path
echo "Checking the logs directory: $LOG_DIRECTORY"

# Check if the logs directory exists
if [ -d "$LOG_DIRECTORY" ]; then
    # Iterate over all files in the logs folder
    for LOG_FILE in "$LOG_DIRECTORY"/*; do
        # Check if it's a regular file (logs should be regular files)
        if [ -f "$LOG_FILE" ]; then
            # Get the file's age in seconds
            FILE_AGE=$(($(date +%s) - $(stat -c %Y "$LOG_FILE")))
            
            # Check if the log file is older than 60 days (5,184,000 seconds)
            if [ "$FILE_AGE" -gt 5184000 ]; then
                echo "The log file '$LOG_FILE' is older than 60 days and will be deleted."
                rm "$LOG_FILE"  # Delete the log file
            else
                echo "The log file '$LOG_FILE' is less than 60 days old."
            fi
        fi
    done
else
    echo "The logs directory '$LOG_DIRECTORY' does not exist."
fi
