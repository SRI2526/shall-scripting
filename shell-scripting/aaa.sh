dnf install mongodb-org -y &>> $logfiles
VALIDATE $? "Instald Mongo.DB"
systemctl enable mongod &>> $logfiles
VALIDATE $? "Enable Mongo.DB"
systemctl start mongod &>> $logfiles
VALIDATE $? "Starting Mongo.DB"

sed -i 's/127.0.0.1/0.0.0.0/g /etc/mongod.conf' &>> $logfiles
VALIDATE $? "Esiting Remote Access to Mongo.DB"
systemctl restart mongod
VALIDATE $? "Restarting Mongo.DB"
