#!/bin/bash

set -eu

# Show argumentss
usage(){
    echo "Usage: $0 <source_directory> <backup_destination>"
    echo "Example: $0 /home/ubuntu/app /home/ubuntu/backups"
    exit 1
}

# Checking source directory
check_source(){
    if [ ! -d "$src" ]; then
        echo "Error: Source directory '$src' does not exist."
        exit 1
    fi
}

# Creating backup
backup(){
    echo "Taking Backup"

    timestamp=$(date +%Y-%m-%d-%H-%M-%S)
    archive="$dest/backup-$timestamp.tar.gz"

    if tar -czf "$archive" "$src" &>/dev/null; then
        echo "Backup completed successfully."
    else
        echo "Error: Backup failed."
        exit 1
    fi

    echo
}

# Verifying archive and print details
verify_backup(){
    echo "Backup Details"

    if [ -f "$archive" ]; then
        size=$(du -h "$archive" | cut -f1)

        echo "Archive Name : $archive"
        echo "Archive Size : $size"
    else
        echo "Error: Archive was not created."
        exit 1
    fi

    echo
}

# Deletes backups older than 14 days
delete_old_backups(){
    echo "Removing Old Backups"

    old_backups=$(find "$dest" -type f -name "backup-*.tar.gz" -mtime +14)

    if [ -z "$old_backups" ]; then
        echo "No backups older than 14 days found."
        return
    fi

    for file in $old_backups; do
        rm "$file"
        echo "Removed Archive : $file"
    done
}

# Check arguments
if [ $# -ne 2 ]; then
    usage
fi

src="$1"
dest="$2"

# Create destination if it doesn't exist
mkdir -p "$dest"

check_source
backup
verify_backup
delete_old_backups
