#!/bin/bash
#username=$1
#password=$2
echo "Plise enter username::" #read అనేది username valu ని autometic గా $username లో lode చేస్తుంది. 
                              # -s మనం type చేసిన దానిని run time లో hide చేస్తుంది.
read -s username
echo "plise enter password::"
read -s password

echo "username is = $username , password is = $password"