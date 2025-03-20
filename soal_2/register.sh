#!/bin/bash

DATA_FILE="/data/player.csv"

# Pastikan file database ada, jika tidak buat dengan header
if [ ! -f "$DATA_FILE" ]; then
    echo "email,username,password" | sudo tee "$DATA_FILE" > /dev/null
    sudo chmod 666 "$DATA_FILE"  # Beri izin baca/tulis ke semua user
fi

echo "Enter your email :"
read email

# Validasi email
until [[ "$email" == *"@"* && "$email" == *"."* ]]; do
    echo "Email is not valid"
    read -p "Enter your email again: " email
    echo ""
done

# Cek apakah email sudah terdaftar
if grep -q "^$email," "$DATA_FILE"; then
    echo "Error: Email already registered!"
    exit 1
fi
echo "Enter your username :"
read username

echo "Enter your password :"
read password

# Validasi password
until [[ ${#password} -ge 8 && "$password" =~ [0-9] && "$password" =~ [a-zA-Z] ]]; do
    echo "Password must be at least 8 characters, contain at least 1 number, and 1 letter"
    read -p "Enter your password again: " password
    echo ""
done

# Simpan data ke file CSV
echo "$email,$username,$password" >> "$DATA_FILE"

echo "Registration successful!"
