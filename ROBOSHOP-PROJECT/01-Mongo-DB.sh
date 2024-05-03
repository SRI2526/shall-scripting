#!/bin/bash
ID=$(id -u)
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/messages-log/$0--$d.log"
R="\e[31m"
G="\e[32m" 
Y="\e[33m"
N="\e[0m"
echo "stript start executing at $d" &>> $logfiles
if [ $ID -ne 0 ] #ROOT user అవునా కాదా చూడడానికి.
then
    echo -e "$R ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS $N."
    exit 1 #ఇది error వస్తే ఇకడితో stop అవుతుంది.

else
    echo -e "$G YOU ARE IN THA ROOT USER $N."
fi
VALIDATE(){ #package install అయింద లేదా చూడడానికి.
    if [ $1 -ne 0 ]
    then
        echo -e "$R ERROR $N:: $2.....$R FAILED $N" # -e color రావడానికి.
    else
        echo -e "$2.....$G SUCCESS $N."
    fi
}
cp mongo.repo /etc/yum.repos.d/mongo.repo &>> $logfiles
VALIDATE $? "Copy Mongo.DB Repo"

dnf install mongodb-org -y &>> $logfiles
VALIDATE $? "Instald Mongo.DB"
systemctl enable mongod &>> $logfiles
VALIDATE $? "Enable Mongo.DB"
systemctl start mongod &>> $logfiles
VALIDATE $? "Starting Mongo.DB"

sed -i 's/127.0.0.1/0.0.0.0/g' /etc/mongod.conf &>> $logfiles
VALIDATE $? "Esiting Remote Access to Mongo.DB"
systemctl restart mongod
VALIDATE $? "Restarting Mongo.DB"




