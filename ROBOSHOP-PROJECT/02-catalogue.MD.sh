#!/bin/bash
ID=$(id -u)
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/messages-log/$0--$d.log"
R="\e[31m"
G="\e[32m" 
Y="\e[33m"
N="\e[0m"
MONGODB_PRIVATE_IP=""
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
dnf module disable nodejs -y &>> $logfiles
VALIDATE $? "Disable Nodejs"
dnf module enable nodejs:18 -y &>> $logfiles
VALIDATE $? "Enable Nodejs-18"
dnf install nodejs -y &>> $logfiles
VALIDATE $? "Installing Nodejs-18"

id roboshop
if [ $? -le 0 ]
then
    useradd roboshop &>> $logfiles
    VALIDATE $? "Roboshop User Creation"
else
    echo -e "Rovoshop Usre Have $Y SKOIPPING $N"
fi

mkdir -p /app &>> $logfiles # -p ఇది app allrady వుంటే create చేయదు. లేకపోతే create చేస్తుంది.
VALIDATE $? "Create App Directory"

curl -o /tmp/catalogue.zip https://roboshop-builds.s3.amazonaws.com/catalogue.zip &>> $logfiles
VALIDATE $? "Download Catalog Applactuon"

cd /app
unzip -o /tmp/catalogue.zip &>> $logfiles # -o ఇది ovarwriting చేస్తుంది. 
VALIDATE $? "Unziping Catalog Appliction"

npm install &>> $logfiles
VALIDATE $? "Installing Catalog Appliction"

cp /home/ec2-user/ROBOSHOP-PROJECT/catalogue.service /etc/systemd/system/catalogue.service &>> $logfiles
VALIDATE $? "Coping Catalogue Service File"

systemctl daemon-reload &>> $logfiles
VALIDATE $? "Catalogue daemon-reload"

systemctl enable catalogue &>> $logfiles
VALIDATE $? "Enable Catalogue"
systemctl start catalogue &>> $logfiles
VALIDATE $? "start Catalogue"

cp /home/ec2-user/ROBOSHOP-PROJECT/mongo.repo /etc/yum.repos.d/mongo.repo &>> $logfiles
VALIDATE $? "Coping mongo.repo"

dnf install mongodb-org-shell -y &>> $logfiles
VALIDATE $? "Installing mongo.db client"

mongo --host $MONGODB_PRIVATE_IP </app/schema/catalogue.js &>> $logfiles
VALIDATE $? "Loading Catalogue Data In To Mongo.DB"