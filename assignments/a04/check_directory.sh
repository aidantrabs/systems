#!/usr/bin/env bash
# File: check_directory.sh

if [ $# -eq 0 ]; then
    echo "Usage: $0 <directory> [extension]"
    exit 1
fi

directory=$1
extension=$2

if [ ! -d "$directory" ]; then
    echo "Error: Directory '$directory' does not exist."
    exit 1
fi

if [ -z "$extension" ]; then
    count=$(find "$directory" -type f | wc -l)
    echo "Number of regular files in directory '$directory': $count"
else
    count=$(find "$directory" -type f -name "*.$extension" | wc -l)
    echo "Number of regular files in directory '$directory': $count"
fi
