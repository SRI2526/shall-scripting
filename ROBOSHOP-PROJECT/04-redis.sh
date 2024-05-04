#!/bin/bash
ID=$(id -u)
d=$(date +%d-%m-%Y::%H:%M:%S)
logfiles="/var/log/messages/$0--$d.log"
R="\e[31m"
G="\e[32m" 
Y="\e[33m"
N="\e[0m"
echo "stript start executing at $d" &>> $logfiles
if [ $ID -ne 0 ] #ROOT user అవునా కాదా చూడడానికి.
then
    echo -e "$R ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS $N."
    exit 1 #ఇది error వస్తే ఇకడితో stop అవుతుంది..

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
dnf install https://rpms.remirepo.net/enterprise/remi-release-8.rpm -y &>> $logfiles
VALIDATE $? "Installing Remi-Release-8"
dnf module enable redis:remi-6.2 -y &>> $logfiles
VALIDATE $? "Enable Remi-6.2"
dnf install redis -y &>> $logfiles
VALIDATE $? "Installing Redis-6.2"
sed -i 's/127.0.0.1/0.0.0.0/g' /etc/redis/redis.conf &>> $logfiles
VALIDATE $? "Editing Remote Access to Redis"
systemctl enable redis &>> $logfiles
VALIDATE $? "Enable Redis"
systemctl start redis &>> $logfiles
VALIDATE $? "Start Redis"
