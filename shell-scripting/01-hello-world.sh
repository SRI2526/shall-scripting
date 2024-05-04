#!/bin/bash
name="/home/ec2-user/krishna/ram.text"
if [ -e $name ]
then
    echo "ram.text file is have"
else
    echo "this is no match file name"
fi