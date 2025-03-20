#!/bin/bash

DATA_FILE="/data/player.csv"

echo "Enter your email :"
read email

until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
    echo "Email is not valid"
    read -p "Enter your email again: " email
    echo ""
done

echo "Enter your password :"
read -s password  # -s untuk menyembunyikan input password saat mengetik

# Cek apakah kombinasi email dan password cocok di database
if grep -q "^$email,.*,${password}$" "$DATA_FILE"; then
    echo "Login successful! Welcome back, Player."
else
    echo "Error: Invalid email or password."
    exit 1
fi
