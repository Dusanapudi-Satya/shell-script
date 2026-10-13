#!/bin/bash
ID=$(id -u)

echo "script name: $0"

TIMESTAMP=$( date +%F-%H-%M-%S)
LOG_FILE="/tmp/$0-$TIMESTAMP.log"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"

VALIDATE(){

    if [ $1 -ne 0 ];
    then
        echo -e "Error: $2 ... is $R failed $N"
    else
        echo -e "$2 ... is $G SUCCESS $N"
    fi
}

if [ $ID -ne 0 ];
then 
    echo -e " $R Error: Please run with root access $N "
    exit 1 # you can give non zero
else
    echo " you are a root user "
    # exit 0 , means success
fi

yum install mysql -y &>> $LOG_FILE

# validation: to check mysql installed successfully

VALIDATE $? "Installing MySQL"

yum install git -y &>> $LOG_FILE 

# validation: to check GIT installed successfully

VALIDATE $? "Installing GIT"
