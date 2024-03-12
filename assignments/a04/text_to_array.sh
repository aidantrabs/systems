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

file_data=$(cat "$1" | tr -d '.,')
words=()
word=""

for (( i=0; i<${#file_data}; i++ )); do
    char=${file_data:$i:1}

    if [[ "$char" == " " || "$char" == "-" || "$i" -eq $((${#file_data}-1)) ]]; then
        if [[ -n "$word" ]]; then
            words+=("$word")
            word=""
        fi
    else
        word+="$char"
    fi
done

if [[ -n "$current_word" ]]; then
    words+=("$current_word")
fi

echo "Array elements:"
for curr_word in "${words[@]}"; do
    echo "$curr_word"
done
