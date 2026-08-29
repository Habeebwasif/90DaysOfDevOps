#!/bin/bash

packages=("nginx" "curl" "wget")

for package in "${packages[@]}"
do
    if dpkg -s "$package" &> /dev/null
    then
        echo "$package is already installed and skipping"
    else
        echo "$package is not installed. Startingg Installation.."
        sudo apt install -y "$package"
    fi
done
