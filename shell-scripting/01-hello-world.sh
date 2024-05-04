#!/bin/bash
echo "File Name"
read file_name

echo "destnastion parth"
read destnastion_parth
#name="/home/ec2-user/krishna/ram.text"
if [ -e $file_name ]
then
    echo "ram.text file is have"
    a="0"
else
    echo "this is no match file name"
    echo "File Name"
    read file_name
fi
echo "$a"
