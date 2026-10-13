#!/bin/bash
ID=$(id -u)
VALIDATE(){

    if [ $1 -ne 0 ];
    then
        echo "Error: $2 ... is failed"
    else
        echo "$2 ... is SUCCESS"
    fi
}
if [ $ID -ne 0 ];
then 
    echo "Please run with root access"
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
