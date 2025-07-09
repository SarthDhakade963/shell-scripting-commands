#!/bin/bash

count=0
# IFS = Input File Separator
while IFS= read -r line
do
	if [[ "$line" == *$1* ]]; then
		((count++))
	fi
done < sample_log.log

echo "Total number of $1 word in log file : $count"
