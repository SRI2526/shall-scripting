#!/bin/bash
echo "File Name"
read 
echo "destnastion parth"
read 
name="/home/ec2-user/krishna/ram.text"
if [ -e $name ]
then
    echo "ram.text file is have"
    a="0"
else
    echo "this is no match file name"
fi
echo "$a"