#!/usr/bin/env bash
# File: check_directory.sh

if [ -z "$1" ]; then
    echo "Usage: ./check_directory.sh <directory> [extension]"
    exit 1
fi

if [ ! -d "$1" ]; then
    echo "Error: Directory '$1' does not exist."
    exit 1
fi

if [ -z "$2" ]; then
    count=$(find "$1" -type f | wc -l)
    echo "Number of regular files in directory '$1': $count"
else
    count=$(find "$1" -type f -name "*.$2" | wc -l)
    echo "Number of regular files in directory '$1': $count"
fi