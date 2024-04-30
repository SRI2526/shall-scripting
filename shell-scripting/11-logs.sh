#!/bin/bash
ID=$(id -u) 
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/$0--$d.log"


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
yum install java -y &>> $logfiles
VALIDATE $? "Installing java"
yum install nginx -y &>> $logfiles
VALIDATE $? "Installing nginx"

