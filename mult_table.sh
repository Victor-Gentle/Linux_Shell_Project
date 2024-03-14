#!/bin/bash

# Function to display the multiplication table
display_table() {
    local num=$1
    local start=$2
    local end=$3
    
    echo "Multiplication table for $num from $start to $end:"
    for ((i=start; i<=end; i++)); do
        echo "$num x $i = $((num * i))"
    done
}

# Main script starts here
echo "Welcome to the Multiplication Table Generator!"

while true; do
    # Prompt the user to enter a number
    read -p "Enter a number for the multiplication table: " number
    
    # Validate if the input is a number
    if ! [[ $number =~ ^[0-9]+$ ]]; then
        echo "Error: Please enter a valid number."
        continue
    fi
    
    # Ask the user if they want a full table or a partial table
    read -p "Do you want a full table (1 to 10) or a partial table? (full/partial): " choice
    
    # Check user's choice and generate the table accordingly
    if [ "$choice" = "full" ]; then
        display_table $number 1 10
    elif [ "$choice" = "partial" ]; then
        # Prompt for start and end of the range
        read -p "Enter the start of the range: " start_range
        read -p "Enter the end of the range: " end_range
        
        # Validate the range inputs
        if ! [[ $start_range =~ ^[0-9]+$ ]] || ! [[ $end_range =~ ^[0-9]+$ ]]; then
            echo "Error: Please enter valid numbers for the range."
            continue
        elif (( start_range > end_range )); then
            echo "Error: Start of the range cannot be greater than end of the range."
            continue
        else
            display_table $number $start_range $end_range
        fi
    else
        echo "Invalid choice. Please enter 'full' or 'partial'."
        continue
    fi
    
    # Ask if the user wants to generate another table
    read -p "Do you want to generate another table? (yes/no): " again
    if [ "$again" != "yes" ]; then
        break
    fi
done

echo "Thank you for using the Multiplication Table Generator!"

