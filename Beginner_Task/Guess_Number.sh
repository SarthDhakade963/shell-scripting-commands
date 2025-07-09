#!/bin/bash

# Generate a random number between 1 and 10
target=$((RANDOM % 100 + 1))
attempts=0;

echo "Welcome to the Number Guessing Game!"
echo "Guess a number between 1 and 100"

while true
do
	read -p "👉 Your guess:" guess
	((attempts++))

	#Validate input

	if ! [[ "$guess" =~ ^[0-9]+$ ]]; then
		echo "❌ Not a number! Please enter valid digits only."
		continue
	fi

	if [ "$guess" -eq "$target" ]; then
		echo "🎉 Correct! The number was $target."
		echo "Attempts : $attempts"
		break
	elif [ "$guess" -lt "$target" ]; then
		echo "📉 Too low! Try again."
	else
		echo "📈 Too high! Try again."
	fi

	if [ "$attempts" -gt 7 ]; then
		read -p "You've tried $attempts times. Want to reveal the answer? (yes/no): " option

		if [ "$option" == "yes" ]; then
			echo "The answer is $target"
			break
		fi
	fi
done
