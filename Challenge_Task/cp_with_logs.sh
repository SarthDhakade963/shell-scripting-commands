#!/bin/bash

set -euo pipefail

# ---- Trap on Error ----
trap 'echo "❌ ERROR on line $LINENO";exit 1' ERR

# ---- Check Argument ----

if [ $# -ne 2 ]; then
	echo "Usage : $0 <source_file> <destination_path>"
	exit 1
fi

src_file="$1"
dest_path="$2"
timestamp=$(date +"%F_%H_%M_%S")
log_dir="logs"
log_file="#log_dir/copy_log_$timestamp.txt"

# ---- Setup Log Directory ----
mkdir -p "$log_dir"

# ---- Perform Copy ----
echo "📝 Copying '$src_file' to '$dest_path'..."
if cp "$src_file" "$dest_path"; then
	echo "✅ Copy successful"
	echo "[$timestamp] SUCCESS: '$src_file' copied to '$dest_path'" >> "$log_file"
else
	echo "❌ Copy failed"
  	echo "[$timestamp] FAILED: Could not copy '$src_file' to '$dest_path'" >> "$log_file"
	exit 1
fi

