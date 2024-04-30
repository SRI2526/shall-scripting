#!/bin/bash
ID=$(id -u) 
date=$(date date +%d-%m-%y)
time=$(DATE +%H:%M:%S)

VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "ERROR:: $2.....FAILED"
        exit 1
    else
        echo "$2.....SUCCESS."
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS."
    exit 1
else
    echo "YOU ARE IN THA ROOT USER."
fi
yum install java -y 
VALIDATE $? "Installing java"
yum install nginx -y
VALIDATE $? "Installing nginx"
echo "DATE = $date"
echo "TIME = $time"