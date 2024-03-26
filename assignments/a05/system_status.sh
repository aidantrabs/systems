#!/bin/bash

################################################################################
# Assignment: System Status Script
# Author: [Aidan Traboulay]
# Date: [03/25/2024]
#
# Description:
#   This script monitors various system metrics such as CPU utilization, free memory,
#   and disk usage, and provides warnings if any metric exceeds a specified threshold.
#
# Instructions:
#   1. Complete the implementation of the following functions:
#      - cpu_utilization: Check CPU utilization and compare it with a threshold percentage.
#      - mem_free: Check free memory percentage and compare it with a threshold.
#      - disk_usage: Check disk usage percentage and compare it with a threshold.
#      - send_report: Send the system status report to the provided email address.

cpu_utilization () {
    # Function to check CPU Utilization and compare it with a threshold percentage
    # Usage: cpu_utilization <cpu_threshold_percentage>
    # Arguments:
    #   - cpu_threshold_percentage: The threshold percentage for CPU usage (between 0 and 100)
    # Returns:
    #   - "cpu ok!!" if CPU utilization is below the threshold
    #   - "cpu warning!!" if CPU utilization is above threshold
    if [ -z "$1" ]; then
        echo "Usage: cpu_utilization <cpu_threshold_percentage>"
        exit 1
    fi
  
    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the CPU threshold percentage between 0 to 100"
        exit 1
    fi

    usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')
    echo "cpu utilization: $usage"

    if [ $(echo "$usage >= $1" | bc) -eq 1 ]; then
        echo "cpu warning!!"
    else
        echo "cpu ok!!"
    fi
}

mem_free () {
    # Function to check the percentage of free memory and compare it with a threshold
    # Usage: mem_free <free_memory_threshold_percentage>
    # Arguments:
    #   - free_memory_threshold_percentage: The threshold percentage of free memory (between 0 to 100)
    # Returns:
    #   - "memory warning!!" if the memory free is below the threshold
    #   - "memory ok!!" if the memory free is above the threshold
    if [ -z "$1" ]; then
        echo "Usage: mem_free <free_memory_threshold_percentage>"
        exit 1
    fi

    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the free memory threshold percentage between 0 to 100"
        exit 1
    fi

    free_mem=$(free | grep Mem | awk '{print $4/$2 * 100.0}')

    echo "percent memory free is: $free_mem %"

    if [ $(echo "$free_mem < $1" | bc) -eq 1 ]; then
        echo "memory warning!!"
    else
        echo "memory ok!!"
    fi
}

disk_usage () {
    # Function to check disk usage and display warning if it exceeds a threshold percentage
    # Usage: disk_usage <disk_threshold_percentage>
    # Arguments:
    #   - disk_threshold_percentage: The threshold percentage for disk usage (0-100)
    # Returns:
    #   - "Disk ok!!" if disk usage is below the threshold
    #   - "Disk warning!!" if disk usage is above the threshold
    if [ -z "$1" ]; then
        echo "Usage: disk_usage <disk_threshold_percentage>"
        exit 1
    fi

    if [ "$1" -lt 0 ] || [ "$1" -gt 100 ]; then
        echo "Enter the disk usage threshold percentage between 0 to 100"
        exit 1
    fi

    disk_usage=$(df --output=pcent | tail -n +2 | tr -d '%' | sort -n | tail -1)

    echo "Disk usage: $disk_usage"

    if [ $(echo "$disk_usage >= $1" | bc) -eq 1 ]; then
        echo "Disk warning!!"
    else
        echo "Disk ok!!"
    fi
}

send_report () {
    # Function to send a system status report via email
    # Usage: send_report <email_address>
    # Arguments:
    #   - email_address: The email address to send the report to

    if [ -z "$1" ]; then
        echo "Usage: send_report <email_address>"
        exit 1
    fi

    echo "Caputuring the system status"
    
    report=$(check_all)

    echo "Sending email with the system status to $1"
    echo " "
    echo "##########################################"
    echo " "

    echo "report" | mail -s "System Status Report" "$1"
}

check_all () {
    # Function to check CPU utilization, free memory, and disk usage
    # Usage: check_all

    echo "##########################################"
    echo " "
    echo "Testing CPU utilization, free memory, disk usage status of the system on $(date)"
    echo " "
    echo "##########################################"
    echo " "
    cpu_utilization 80
    echo " "
    echo "##########################################"
    echo " "
    mem_free 95
    echo " "
    echo "##########################################"
    echo " "
    disk_usage 80
    echo " "
    echo "##########################################"
    echo " "
}

check_all
send_report "trab5590@mylaurier.ca"