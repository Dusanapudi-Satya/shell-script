#!/bin/bash
ID=$(id -u)

if [ $ID -ne 0 ];
then 
    echo "Please run with root access"
    exit 1 # you can give non zero
else
    echo " you are a root user "
    # exit 0 , means success
fi
yum install mysql -y