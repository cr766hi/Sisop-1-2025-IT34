#!/bin/bash

DATA_FILE="/data/player.csv"
SALT="arcaea123" 

echo "Enter your email :"
read email

until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
    echo "Email is not valid"
    read -p "Enter your email again: " email
    echo ""
done

echo "Enter your password :"
read -s password  

hashed_password=$(echo -n "$SALT$password" | sha256sum | awk '{print $1}')


if grep -q "^$email,.*,${hashed_password}$" "$DATA_FILE"; then
    echo "Login successful! Welcome back, Player."
else
    echo "Error: Invalid email or password."
    exit 1
fi
