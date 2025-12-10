#!/bin/bash

# Simple Interest Calculator
# This script calculates simple interest based on user input

echo "========================================="
echo "     SIMPLE INTEREST CALCULATOR"
echo "========================================="
echo ""

# Get principal amount from user
read -p "Enter the principal amount: " principal

# Validate principal input
if ! [[ "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$principal <= 0" | bc) -eq 1 ]]; then
    echo "Error: Principal must be a positive number."
    exit 1
fi

# Get rate of interest from user
read -p "Enter the rate of interest (in percentage): " rate

# Validate rate input
if ! [[ "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$rate <= 0" | bc) -eq 1 ]]; then
    echo "Error: Rate must be a positive number."
    exit 1
fi

# Get time period from user
read -p "Enter the time period (in years): " time

# Validate time input
if ! [[ "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ $(echo "$time <= 0" | bc) -eq 1 ]]; then
    echo "Error: Time must be a positive number."
    exit 1
fi

echo ""
echo "-----------------------------------------"
echo "Calculation Details:"
echo "-----------------------------------------"
echo "Principal Amount: $ $principal"
echo "Rate of Interest: $rate% per year"
echo "Time Period: $time years"
echo ""

# Calculate simple interest using the formula: SI = (P * R * T) / 100
# Using bc for floating point arithmetic
interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)

# Calculate total amount
total=$(echo "scale=2; $principal + $interest" | bc)

echo "-----------------------------------------"
echo "Results:"
echo "-----------------------------------------"
echo "Simple Interest: $ $interest"
echo "Total Amount: $ $total"
echo "========================================="
echo ""

# Optional: Ask if user wants to calculate again
read -p "Would you like to calculate again? (yes/no): " choice
if [[ "$choice" =~ ^[Yy][Ee][Ss]|[Yy]$ ]]; then
    # Clear screen and restart script
    clear
    exec "$0"
else
    echo "Thank you for using the Simple Interest Calculator!"
fi
