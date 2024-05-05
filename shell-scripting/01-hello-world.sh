#!/bin/bash
R="\e[31m"
N="\e[0m"
echo "File Name :"
read file_name

echo "Destination Part :"
read Destination_Part
#name="/home/ec2-user/krishna/ram.text"
if [ -e $file_name ]
then
    a=$?
else
    a=$?
fi
i=$a
while [ $i -ne 0 ];
do
    echo -e "$R ERROE $N:::Your File Is Not Exist,Please Try Again."
    echo "File Name :"
    read file_name
    if [ -e $file_name ]
    then
        i=$?
    else
        i=$?
    fi
    i=$?
done 
cp $file_name $destnastion_parth
