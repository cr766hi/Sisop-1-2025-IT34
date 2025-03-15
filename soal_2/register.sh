#!/bin/bash

DATA_FILE="/data/player.csv"

echo "Enter your email :"
read email

until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
echo "Email Is not valid"
read -p "Enter your email again" email
echo ""
done

if grep -q "^$email," "$DATA_FILE"; then
    echo "Error: Email already registered!"
    exit 1
fi

echo enter your username :
read username

echo enter your password :
read password

until [[ ${#password} -ge 8 && "$password" =~ [0-9] && "$password" =~ [a-zA-Z] ]]; do
echo "Password must be at least 8 characters, contain at least 1 number, and 1 letter"
read -p "Enter your password again" password
echo ""
done

echo $email $username $password >> DATA_FILE
