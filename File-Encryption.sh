#!/bin/bash

echo "=========================================="
echo "        Welcome to file encryption        "
echo "=========================================="
echo ""
echo "Give your file a name: "
read name
echo "Give your file some content: "
read content
echo "Which type of encryption do you want? (Reply with the number only)"
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
echo $content | gzip > $name.gz
echo "Done!"

elif [ $compressionType = 2 ]; then
echo $content | bzip2 > $name.bz2
echo "Done!"

elif [ $compressionType = 3 ]; then
echo $content > $name.txt
tar -cf $name.tar $name.txt && rm $name.txt
echo "Done!"

elif [ $compressionType = 4 ]; then
echo $content | zip > $name.zip
echo "Done!"

else exit
fi

echo "Do you want to decompress?"
echo "1. Yes"
echo "2. No"
read answer

if [ $answer = 1 ] && [ $compressionType = 1 ]; then
	gunzip $name.gz
elif [ $answer = 1 ] && [ $compressionType = 2 ]; then
	bunzip2 $name.bz2
elif [ $answer = 1 ] && [ $compressionType = 3 ]; then
	tar -xf $name.tar && rm $name.tar
elif [ $answer = 1 ] && [ $compressionType = 4 ]; then
	unzip -p $name.zip > $name.txt && rm $name.zip
else exit
fi




