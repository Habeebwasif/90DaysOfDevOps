#!/bin/bash

# Checks if running as root
if [ "$EUID" -ne 0 ]
then
    echo "Error: Please run this script as root."
    exit 1
fi

packages=("nginx" "curl" "wget")

for package in "${packages[@]}"
do
    if dpkg -s "$package" &> /dev/null
    then
        echo "$package is already installed and skipping"
    else
        echo "$package is not installed. Startingg Installation..."
        apt install -y "$package"
    fi
done
