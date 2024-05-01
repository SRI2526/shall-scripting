#!/bin/bash
ID=$(id -u)
R="\e[31m"
G="\e[32m" 
Y="\e[33m"
N="\e[0m"
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
        echo -e "$R ERROR $N:: $2.....FAILED" # -e color రావడానికి.
    else
        echo -e "$2.....$G SUCCESS $N."
    fi
}
for packages in $@ #$@ ఇది అన్నీ argmants ని చూపిస్తుంది. (for loop లో కి తెచ్చుకుంటుంది).
do
    yum list install $packages #package వుందా లేదా చూడడానికి.
    if [ $? -ne 0 ]
    then
        yum install $packages -y #package లేకపోతే install చేస్తుంది.
        VALIDATE $? "installing $packages"
    else
        echo -e "$packages Is Already Insatalled ... $Y SKIPPING $N" #package వుంటే skipp చేస్తుంది. 
done
