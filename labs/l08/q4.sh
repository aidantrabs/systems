#!/bin/bash

file="calculator_log.txt"

while true; do
    echo "Enter the first number:"
    read first_number

    echo "Enter the second number:"
    read second_number

    echo "Pick the operation (+, -, *, /, %):"
    read operation

    case $operation in
        +)
            result=$((first_number + second_number))
            ;;
        -)
            result=$((first_number - second_number))
            ;;
        *)
            result=$((first_number * second_number))
            ;;
        /)
            if [ "$second_number" -eq 0 ]; then
                echo "Can't divide by zero. L mans"
                continue
            else
                result=$((first_number / second_number))
            fi
            ;;
        %)
            result=$((first_number % second_number))
            ;;
        *)
            echo "Invalid"
            continue
            ;;
    esac

    echo "Output: $result"

    echo "$first_number $operation $second_number = $result" >> $file

    echo "Do you want to perform another calculation? (y/n):"
    read answer
    if [ "$answer" != "y" ]; then
        break
    fi
done
