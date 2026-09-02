#!/bin/bash

set -eu

usage(){
    echo "Usage: ./log_rotate.sh /var/log/app_name"
    echo "Provide the directory of log files that you want to rotate."
    echo "Example: /var/log/apache2"
    exit 1
}

# first let us check if an argument is provided
if [ $# -eq 0 ]; then
    usage
fi

dir=$1

check_dir(){
    if [ ! -d "$dir" ]; then
        echo "Error-- No such directory exists: $dir"
        exit 1
    fi
}

gzip_count=0
delete_count=0

# Compressingg .log files older than 7 days and counting
compress(){
    file_list=$(find "$dir" -type f -name "*.log" -mtime +7)

    for file in $file_list; do
        gzip "$file"
        gzip_count=$((gzip_count + 1))
    done
}

# Deleting .gz files older than 30 days and delete count
delete(){
    zip_file=$(find "$dir" -type f -name "*.gz" -mtime +30)

    for file in $zip_file; do
        rm "$file"
        delete_count=$((delete_count + 1))
    done
}

check_dir
compress
delete

echo "Total Log Files Zipped  : $gzip_count"
echo "Total Zip Files Deleted : $delete_count"
