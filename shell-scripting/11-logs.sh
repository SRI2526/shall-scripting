#!/bin/bash
ID=$(id -u) # ROOT లో వుంటే 0 వస్తుంది.ROOR లో లేకపోతే NUMNER వస్తుంది./ROOT(SUDO SU)USER అవునా కాదా అని ID లో STORE అవుతుంది. 
#------------------------------------------------------------------------------------------------------
TIMESTAMP=$(date +%d-%m-%Y/TIME-%H:%M:%S)
SAVELOGS="/tmp/$0-$TIMESTAMP.log"
#------------------------------------------------------------------------------------------------------
functions(){ # function repeed the code 
    if [ $1 -ne 0 ] # $? అనేది cummand success అవతే  0 వస్తుంది. లేదా number వస్తుంది.
    then
        echo "ERROR :: $2... is filed."
        exit 1
    else
        echo "$2... is success."
    fi
}
#------------------------------------------------------------------------------------------------------
if [ $ID -ne 0 ]
then
    echo -e "ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS."
    exit 1 #ఇది error వస్తే ఇకడితో stop అవుతుంది.

else
    echo "YOU ARE IN THA ROOT USER."
fi
#----------------------------------------------------------------------------------------------------------
yum install java -y  #packege install చేయడం.
#----------------------------------------------------------------------------------------------------------
functions $? "instaling java" #function ని call చేయడం. ఇందులో $? arg1,instaling java arg2.
#----------------------------------------------------------------------------------------------------------