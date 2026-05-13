#!/bin/bash

echo "========================================"
echo "        Welcome to file decryption      "
echo "========================================"
echo ""

#Accept file
echo "Enter the full path to your file: "
read input_file

#Check if it exists
if [ ! -f $input_file ]; then
	echo "File not found"
	exit
fi

#Check file type
file_type=$(file --mime-type -b $input_file)

#Run it against known file types
case $file_type in
application/x-bzip2)
			echo "Your file is: bzip2 format?"
			echo "1. Yes"
			echo "2. No"
			read confirmation;;
application/gzip)
			echo "Your file is: gzip format?"
                        echo "1. Yes"
                        echo "2. No"
                        read confirmation;;
application/x-tar)
			echo "Your file is: tar format?"
                        echo "1. Yes"
                        echo "2. No"
                        read confirmation;;
application/zip)
			echo "Your file is: zip format?"
                        echo "1. Yes"
                        echo "2. No"
                        read confirmation;;
application/*)
			echo "File format not supported."
			exit;;
esac

#Handle negative confirmations
	if [ $confirmation = 2 ]; then
		echo "Please retry with a supported file format (.bz2, .gz, .tar, .zip)"
		exit
	fi

#Get the base name of the file from the path
name=$(basename $input_file | cut -d. -f1)

#Decompress
if [ $confirmation = 1 ] && [ $file_type = application/x-bzip2 ]; then
	echo "Decompressing..."
	bunzip2 -c $input_file > ~/Downloads/$name
	echo "Done."
	echo "Your file has been decompressed to: ~/Downloads/$name"
	exit
elif [ $confirmation = 1 ] && [ $file_type = application/gzip ]; then
	echo "Decompressing..."
        gunzip -c $input_file > ~/Downloads/$name
        echo "Done."
        echo "Your file has been decompressed to: ~/Downloads/$name"
        exit
elif [ $confirmation = 1 ] && [ $file_type = application/x-tar ]; then
        echo "Decompressing..."
        tar -xf $input_file -C ~/Downloads/
        echo "Done."
        echo "Your file has been decompressed to: ~/Downloads/$name"
        exit
elif [ $confirmation = 1 ] && [ $file_type = application/zip ]; then
        echo "Decompressing..."
        unzip $input_file -d ~/Downloads/
        echo "Done."
        echo "Your file has been decompressed to: ~/Downloads/$name"
        exit
fi

