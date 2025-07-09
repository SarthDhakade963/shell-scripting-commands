#!/bin/bash
name="Sarthak"
current_user=$(whoami)
current_date=$(date +%F)
current_time=$(date +%T)
machine_name=$(hostname)
uptime_info=$(uptime -p)

echo "Hello, $name!"
echo "Today is : $(date +%F)"
echo "User : $current_user"
echo "Hostname : $machine_name"
echo "Time : $current_time"
echo "Uptime : $uptime_info"


