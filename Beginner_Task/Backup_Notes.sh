#!/bin/bash

# === Configuration ===
SOURCE_DIR="$HOME/notes"
BACKUP_DIR="$HOME/backups"
DATE=$(date +%f)
FILENAME="notes-backup-$DATE.tar.gz"
DEST="$BACKUP_DIR/$FILENAME"

# === Create backup folder if not exists ===
mkdir -p "$BACKUP_DIR"

# Checking source directory
if [ ! -d "$SOURCE_DIR" ]; then
	echo "❌ Source folder $SOURCE_DIR does not exist."
	exit 1
fi

# === Create the Backup ===
tar -czf "$DEST" "$SOURCE_DIR"

# === Print Result ===
if [ $? -eq 0 ]; then
	echo "✅ Backup created: $DEST"
else
	echo "❌ Backup failed!"
fi
