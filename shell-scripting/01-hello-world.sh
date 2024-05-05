#!/bin/bash
echo "File Name"
read file_name

echo "destnastion parth"
read destnastion_parth
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
    echo "Trigan agine file name"
    read file_name
    if [ -e $file_name ]
    then
        i=$?
    else
        i=$?
    fi
    i=$?
    echo "$i"
done 
cp $file_name $destnastion_parth
