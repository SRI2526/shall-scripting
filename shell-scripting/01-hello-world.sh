#!/bin/bash
echo "File Name"
read file_name

echo "destnastion parth"
read destnastion_parth
#name="/home/ec2-user/krishna/ram.text"
function(){
    if [ $1 -ne 0 ]
    then
        echo "file is not have.plice enter File Name"
        read file_name
        echo "destnastion parth"
        read destnastion_parth
    fi
}
if [ -e $file_name ]
then
    
else
    "function $?"
fi