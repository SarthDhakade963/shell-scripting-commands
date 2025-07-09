#!/bin/bash

ports=("80" "443" "22")

echo "🔍 Checking status of ports:"
for port in "${ports[@]}"; do
	echo "Checking $port..."

	ss -tulwn "$port" > /dev/null 2>&1
	# $? stores the exit status of the last executed command.
	# 0 means Success and any other number means Failure
	if [ $? -eq 0 ]; then
		echo "✅ $port is running"
	else
		echo "❌ $port is NOT running"
	fi
done
