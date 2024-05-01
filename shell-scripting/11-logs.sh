#!/bin/bash
ID=$(id -u) 
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/messages/$0--$d.log" #$0=SCRIPT NAME    COLORS =\e[31m
R="\e[31m"                                                 #GREEN =\e[32m
G="\e[32m"                                                 #YELLO =\e[33m
Y="\e[33m"                                                #NURMAL =\e[0m
N="\e[0m"


VALIDATE(){
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR $N:: $2.....FAILED" # -e color రావడానికి.
        exit 1
    else
        echo -e "$2.....$G SUCCESS $N."
    fi
}

if [ $ID -ne 0 ]
then
    echo -e "$R ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS $N."
    exit 1
else
    echo -e "$G YOU ARE IN THA ROOT USER $N."
fi
yum install java -y &>> $logfiles    #(&>> log right or rong)(1>> only success)(2>> only failure)(>>append the log)
VALIDATE $? "Installing java"
yum install nginx -y &>> $logfiles
VALIDATE $? "Installing nginx"


