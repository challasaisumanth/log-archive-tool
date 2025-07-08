#!/bin/bash

# Create archive directory if it doesn't exist
ARCHIVE_DIR="./log_archive"
mkdir -p "$ARCHIVE_DIR"

# Input log directory from user or default to ./logs
LOG_DIR=${1:-"./logs"}

# Check if the log directory exists
if [ ! -d "$LOG_DIR" ]; then
    echo "Log directory '$LOG_DIR' not found!"
    exit 1
fi

# Format: archive-YYYY-MM-DD_HH-MM-SS.tar.gz
TIMESTAMP=$(date "+%Y-%m-%d_%H-%M-%S")
ARCHIVE_NAME="archive-$TIMESTAMP.tar.gz"

# Archive the logs
tar -czf "$ARCHIVE_DIR/$ARCHIVE_NAME" -C "$LOG_DIR" .

echo "Logs from '$LOG_DIR' archived to '$ARCHIVE_DIR/$ARCHIVE_NAME'"
