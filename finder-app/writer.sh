#!/bin/bash

# Check if the number of arguments is correct
if [ $# -ne 2 ]; then
    echo "Error: Two arguments are required."
    exit 1
fi

# Extract the arguments
writefile="$1"
writestr="$2"

# Check if writefile argument is specified
if [ -z "$writefile" ]; then
    echo "Error: File path is not specified."
    exit 1
fi

# Check if writestr argument is specified
if [ -z "$writestr" ]; then
    echo "Error: Text string is not specified."
    exit 1
fi

# Create the directory path if it doesn't exist
dirpath=$(dirname "$writefile")
mkdir -p "$dirpath"

# Create the file with the specified content
echo "$writestr" > "$writefile"

# Check if the file was created successfully
if [ $? -ne 0 ]; then
    echo "Error: Failed to create the file."
    exit 1
fi

# Print success message
echo "File created successfully: $writefile"
exit 0
