#!/bin/bash

echo "=========================================="
echo "        Welcome to file compression       "
echo "=========================================="
echo ""

#Choose mode
echo "Do you want to: (Reply with the number only!)"
echo "1. Create a new file"
echo "2. Import existing file"
read mode

#Handle the choice made
if [ $mode = 1 ]; then 
	echo "Give your file a name: "
	read name
	echo "Give your file some content: "
	read content
	echo $content > $name.txt
	input_file=$name.txt

elif [ $mode = 2 ]; then
	echo "Enter the full path to your file: "
	read input_file

	#Check if file exists
	if [ ! -f $input_file ]; then
		echo "File not found!"
		exit
	fi

	#Use the filename without extension as the archive name
	name=$(basename "$input_file" | cut -d. -f1)
	echo "File found: $input_file"
else exit
fi


echo ""
echo ""
echo "Which type of compression do you want?"
echo "1. gzip"
echo "2. bzip2"
echo "3. tar archive"
echo "4. zip file"
read compressionType

echo "Creating file..."
echo "Writing to file..."
echo "Compressing..."
echo ""


if [ $compressionType = 1 ]; then
	gzip -c $input_file > $name.gz 
	echo "Done! Created ./$name.gz"

elif [ $compressionType = 2 ]; then
	bzip2 -c $input_file > $name.bz2
	echo "Done! Created ./$name.bz2"

elif [ $compressionType = 3 ]; then
	tar -cf $name.tar $input_file
	echo "Done! Created ./$name.tar"

elif [ $compressionType = 4 ]; then
	zip $name.zip $input_file
	echo "Done! Created ./$name.zip"

else exit
fi

