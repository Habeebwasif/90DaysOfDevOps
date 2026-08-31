#!/bin/bash

set -o pipefail

echo "Failed command -o" #pipefail → Stop if any command in a pipeline fails

cat important_file.txt | grep "ERROR" #important_file.txt doesn't exist

echo "Script completed successfully"

# -e → Stop if a command fails
 
set -e

echo "Failed command -e"

mkdir demo_folder

echo "Folder created successfully"

cp myfile.txt demo_folder/ # myfile.txt does'nt exist.

echo "File copied successfully" # stops the script when failure occurs

echo "Script completed successfully" # stops the script when failure occurs

# -u → Stops if we use a variable that doesn't exist

set -u 

name="Script started:"

echo "$name"
echo "User: $username" #fails bcoz theres no variable matched.
