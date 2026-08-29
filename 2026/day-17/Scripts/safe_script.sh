#!/bin/bash

set -e

mkdir /tmp/devops-demo || {
    echo "Error: Failed to create directory"
    exit 1
}

cd /tmp/devops-demo || {
    echo "Error: Failed to navigate to directory"
    exit 1
}

touch devops-demo2.txt || {
    echo "Error: Failed to create file"
    exit 1
}

echo "Script completed successfully!"
echo "Directory created!"
echo "File created!"
