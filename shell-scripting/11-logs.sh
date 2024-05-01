#!/bin/bash
ID=$(id -u) 
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/messages/$Y $0 $N--$d.log" #$0=SCRIPT NAME        COLORS = RED=\e[31m
R="\e[31m"                                                           #GREEN=\e[32m
G="\e[32m"                                                           #YELLO=\e[33m
Y="\e[33m"                                                          #NURMAL=\e[0m
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo "$R ERROR $N:: $2.....FAILED"
        exit 1
    else
        echo "$2.....$G SUCCESS $N."
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS."
    exit 1
else
    echo "YOU ARE IN THA ROOT USER."
fi
yum install java -y &>> $logfiles #  (&>> log right or rong)(1>> only success)(2>> only failure)(>>append the log)
VALIDATE $? "Installing java"
yum install nginx -y &>> $logfiles
VALIDATE $? "Installing nginx"


