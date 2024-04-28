#!/bin/bash
ID=$(id -u) # ROOT లో వుంటే 0 వస్తుంది.ROOR లో లేకపోతే NUMNER వస్తుంది./ROOT(SUDO SU)USER అవునా కాదా అని ID లో STORE అవుతుంది. 

if [ $ID -ne 0 ]
then
    echo -e "ERROR :: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS."
    exit 1 #ఇది error వస్తే ఇకడితో stop అవుతుంది.

else
    echo "YOU ARE IN THA ROOT USER."
fi
#----------------------------------------------------------------------------------------------------------
yum install mysql -y #packege install చేయడం.
#----------------------------------------------------------------------------------------------------------
if [ $? -ne 0 ] # $? అనేది cummand success అవతే  0 వస్తుంది. లేదా number వస్తుంది.
then
    echo "ERROR :: Instaling MySql is filed."
    exit 1
else
    echo "MySql Instaling id success."
fi
#-----------------------------------------------------------------------------------------------------------