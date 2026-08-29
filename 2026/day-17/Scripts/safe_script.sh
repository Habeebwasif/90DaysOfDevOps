#!/bin/bash

set -e

mkdir /tmp/devops-demo-test || {
    echo "Error: Failed to create directory"
    exit 1
}

cd /tmp/devops-demo-test || {
    echo "Error: Failed to navigate to directory"
    exit 1
}

touch devops-demo.txt || {
    echo "Error: Failed to create file"
    exit 1
}

echo "Script completed successfully!"
