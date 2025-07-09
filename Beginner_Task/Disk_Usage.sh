#!/bin/bash

usage=$(df / | tail -1 | awk '{print $5}' | tr -d '%')

#Get disk usage of root (/) as a percentage (e.g., 83%)
echo "Disk usage: $usage%"

# Check against threshol
# -ge means Greater than or Equal to
if [ "$usage" -ge 80 ]; then
	echo "⚠️  WARNING: Disk usage is critically high! ❌"
else
	echo "✅ All good. Disk space is under control."
fi
