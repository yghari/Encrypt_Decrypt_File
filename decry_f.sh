#!/bin/bash

# Get the encrypted file and key and IV files from the command line
enc_file="$1"
key_file="$2"
iv_file="$3"

# Read the key and IV from their respective files
key=$(cat "$key_file")
iv=$(cat "$iv_file")

# Decrypt the file with AES-256-CBC and the key and IV
openssl enc -d -aes-256-cbc -in "$enc_file" -out "${enc_file%.enc}" -K "$key" -iv "$iv"

