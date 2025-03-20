#!/bin/bash

DATA_FILE="/data/player.csv"
SALT="arcaea123"  

sudo mkdir -p /data

if [ ! -f "$DATA_FILE" ]; then
    echo "email,username,hashed_password" | sudo tee "$DATA_FILE" > /dev/null
    sudo chmod 666 "$DATA_FILE" 
fi

echo "Enter your email :"
read email

until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
    echo "Email is not valid"
    read -p "Enter your email again: " email
    echo ""
done

if grep -q "^$email," "$DATA_FILE"; then
    echo "Error: Email already registered!"
    exit 1
fi
echo "Enter your username :"
read username

echo "Enter your password :"
read -s password

# Validasi password
until [[ ${#password} -ge 8 && "$password" =~ [0-9] && "$password" =~ [a-zA-Z] ]]; do
    echo "Password must be at least 8 characters, contain at least 1 number, and 1 letter"
    read -s -p "Enter your password again: " password
    echo ""
done

hashed_password=$(echo -n "$SALT$password" | sha256sum | awk '{print $1}')

echo "$email,$username,$hashed_password" | sudo tee -a "$DATA_FILE" > /dev/null

echo "Registration successful!"
