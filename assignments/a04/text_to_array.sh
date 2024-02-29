#!/usr/bin/env bash
# File: text_to_array.sh

if [ -z "$1" ]; then
    echo "Usage: ./text_to_array.sh <filename>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found."
    exit 1
fi

array=()
while IFS= read -r line || [[ -n "$line" ]]; do
    for word in $line; do
        word=${word//[[:punct:]]/}
        if [ -n "$word" ]; then
            array+=("$word")
        fi
    done
done < "$1"

echo "Array elements:"
for word in "${array[@]}"; do
    echo "$word"
done

