#!/bin/bash

funcsort() {
    if [ $# -lt 1 ] || [ $# -gt 3 ]; then
        echo "Usage: $0 [-n] <input_file> [output_file]"
        exit 1
    fi

    numeric=false
    if [ "$1" == "-n" ]; then
        numeric=true
        shift
    fi

    input_file="$1"
    shift

    if [ ! -e "$input_file" ]; then
        echo "Error: File '$input_file' does not exist."
        exit 2
    elif [ ! -f "$input_file" ]; then
        echo "Error: '$input_file' is not a normal file."
        exit 3
    elif [ ! -r "$input_file" ]; then
        echo "Error: File '$input_file' cannot be read."
        exit 4
    fi

    if [ $# -eq 1 ]; then
        output_file="$1"
    else
        output_file="/dev/stdout"
    fi

    if [ "$numeric" == true ]; then
        sort -n "$input_file" > "$output_file"
    else
        sort "$input_file" > "$output_file"
    fi
}

funcsort "$@"