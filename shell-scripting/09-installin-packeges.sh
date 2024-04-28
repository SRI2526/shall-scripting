#!/bin/bash
ID=$(id -u) # ROOT లో వుంటే 0 వస్తుంది.ROOR లో లేకపోతే NUMNER వస్తుంది./ROOT(SUDO SU)USER అవునా కాదా అని ID లో STORE అవుతుంది. 

if [ $ID -ne 0 ]
then
    echo "ERROR:: SORRY YOU ARE NOT ROOR USER,PLISE TAKE ROOT USER ACCESS."
else
    echo "YOU ARE IN THA ROOT USER."
fi
#----------------------------------------------------------------------------------------------------------
yum install mysql -y #packege install చేయడం.