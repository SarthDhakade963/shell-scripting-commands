#!/bin/bash

services=("nginx" "docker" "redis")

echo "🔍 Checking status of services:"
for service in "${services[@]}"; do
	echo "Checking $service..."
	systemctl status "$service" > /dev/null 2>&1

	if [ $? -eq 0 ]; then
		echo "✅ $service is running"
	else
		echo "❌ $service is NOT running"
	fi
done
