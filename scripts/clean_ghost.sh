#!/bin/bash

# Configuration: Update this path if your bot downloads to a different folder
DOWNLOAD_DIR="/home/opc/bot/downloads"

echo "$(date): Starting storage optimization scan..."

# Check if the directory exists
if [ -d "$DOWNLOAD_DIR" ]; then
    # find: looks in the directory
    # -type f: looks for files only (not folders)
    # -mtime +1: looks for files older than 24 hours
    # -delete: removes them
    find "$DOWNLOAD_DIR" -type f -mtime +1 -delete
    echo "$(date): Cleanup complete. All old temporary files removed."
else
    echo "$(date): Error - Download directory $DOWNLOAD_DIR not found. Check your path."
fi
