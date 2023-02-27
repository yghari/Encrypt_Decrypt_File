#!/bin/bash

# Get the file to encrypt from the command line
file="$1"

# Generate a random 256-bit key and initialization vector
key=$(openssl rand -hex 32)
iv=$(openssl rand -hex 16)

# Encrypt the file with AES-256-CBC and the generated key and IV
openssl enc -aes-256-cbc -in "$file" -out "$file.enc" -K "$key" -iv "$iv"

# Save the key and IV to a file for future decryption
echo "$key" > "$file.enc.key"
echo "$iv" > "$file.enc.iv"

# Remove the original unencrypted file
rm "$file"

