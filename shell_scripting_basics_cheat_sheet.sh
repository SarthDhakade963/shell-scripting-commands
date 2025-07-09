#!/bin/bash

## To print
echo "Hello, World!"

## Variables
name="Sarthak"
echo "Hello, $name"

## Conditionals
if [ "$name" = "Sarthak" ]; then
	echo "Welcome!"
else
	echo "Access Denied"
fi

## Loops
for i in 1 2 3 4 5
do
	echo "Iteration $i"
done

## While Loop
count=1
while [ $count -le 5 ]
do
	echo "Count is $count"
	((count++))
done

## Reading Input
read -p "Enter you name: " username
echo "Hi, $username"


## Functions
greet() {
	echo "Hello $1 $2, good to see!"
}
greet "Sarthak" "Dhakade"

## File Check
if [ -f "/etc/passwd" ]; then
	echo "File exists"
fi

## Arguments
echo "Script name: $0"
echo "First arg: $1"
echo "All args: $@"


## Create an Empty file
touch report.txt

## Delete a File
rm report.txt

## Rename or Move File
mv oldname.txt newname.txt
mv myfile.txt /home/sarth/archive

## Copy file or folder
cp file.txt backup.txt
cp -r folder1 folder2

## Read from File Line by Line
while read line; do
	echo "Line: $line"
done < myfile.txt

## Append and Overwrite
echo "First Line" > myfile.txt
echo "Second Line" >> myfile.txt

## Check if file exists
if [[ -f "notes.txt" ]; then
	echo "✅ File exists!"
else
	echo "❌ File does not exist."
fi


## Loop Over Directory in Files
file="hello.txt"
for file in *.txt
do
	echo "Found file: $file"
done

## Read file Line by Line
while IFS= read -r line
do
	echo "Processing: $line"
done < hello.txt

## Until Loop runs until the conditions become true

count=1
until [ $count -gt 5]
do
	echo "count is : $count"
	((count++))
done


## Loop control

for i in {1..10}
do
	if [ $i -eq 3 ]; then
		echo "Skipping three"
		continue
	fi

	if [ $i -eq 7 ]; then
		echo "Breaks at seven"
		break
	fi

	echo "i=$i"
done


## A HereDoc (short for Here Document) lets you redirect multiple lines of input into a command as if you typed
## them line-by-line.

cat <<EOF > hello.txt
Hello, Sarthak!
Welcome to Shell Scripting
This is a multi-file line
EOF

## Append instead of Overwrite
cat <<EOF >> hello.txt
[$(date)] This log was appended
EOF

## Use variable
name="Sarthak"
cat <<EOF
Hello $name!
Today is $(date)
EOF


## Basic Error Handling
cp file.txt /nonexistent/path
if [ $? -ne 0 ]; then
	echo "❌ Copy failed!"
else
	echo "✅ Copy succeeded!"
fi

## Use set -e to Exit on First Error

set -e #Exit on error
echo "Creating backup..."
cp file.txt /backup/

echo "Uploading to S3..."
aws s3 cp /backup/file.txt s3://my-bucket/

## Trap Error and Cleanup
set -e
trap cleanup EXIT

cleanup() {
	echo "🧹 Cleaning up temporary files..."
	rm -rf /tmp/myapp
}

mkdir /tmp/myapp
cp data.csv /tmp/myapp


## Best Practise for Production Grade Scripts
#!/bin/bash
set -euo pipefail
# e = exit on error
# u = undefined vars are errors
# o pipefail = if any command in a pipeline fails, whole pipeline fails

trap 'echo "❌ ERROR on line $LINENO"; exit 1' ERR

do_backup() {
  cp "$1" "$2"
  echo "✅ Backup complete"
}

do_backup file.txt /nonexistent/backup/

