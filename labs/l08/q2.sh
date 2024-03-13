#!/bin/bash

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
            exit 1
        else
            result=$((first_number / second_number))
        fi
        ;;
    %)
        result=$((first_number % second_number))
        ;;
    *)
        echo "Invalid operation."
        exit 1
        ;;
esac

echo "Output: $result"
