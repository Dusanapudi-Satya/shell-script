#!/bin/bash
ID=$(id -u)
TIMESTAMP=$( date +%F-%H-%M-%S)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0"
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
    echo -e " $R Error: Please run with root access"
    exit 1 # you can give non zero
else
    echo " you are a root user "
    # exit 0 , means success
fi

yum install mysql -y

# validation: to check mysql installed successfully

VALIDATE $? "Installing MySQL"

yum install git -y

# validation: to check GIT installed successfully

VALIDATE $? "Installing GIT"
