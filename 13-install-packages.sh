#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
# step 1: check if the user has root access to install packages
ID=$(id -u)
echo "script name: $0"
TIMESTAMP=$( date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"

echo "script started executing at $TIMESTAMP" &>> $LOG_FILE
VALIDATE(){
    if [ $1 -ne 0 ]
    then 
        echo -e " $2 .. $R Failed $N"
    else
        echo -e " $2 .. $G SUCCESS $N"
    fi    

}
if [ $ID -ne 0 ];
then 
    echo -e " $R Error: Please run with root access $N "
    exit 1 # you can give non zero
else
    echo " you are a root user , proceed to install"
    # exit 0 , means success
fi

# step 2: check if the package is already installed or not
#echo "All arguments passed: $@"
#yum list installed package 
for package in $@
do
    yum list installed $package &>> $LOG_FILE
    if [ $? -ne 0 ]
    then
        yum install $package -y &>> $LOG_FILE
        VALIDATE $? "Installation of $package.."
    else
        echo -e " $package already installed .. $Y SKIPPING $N"
    fi
done
