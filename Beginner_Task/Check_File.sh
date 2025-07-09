#!/bin/bash

file=$1

if [ -f "$file" ]; then
	echo "Appending to existing file..."
	echo "Appended to $(date)" >> "$file"
else
	echo "Creating new file and writing..."
	echo "Created at $(date)" >> "$file"
fi

echo "All done ✅"
