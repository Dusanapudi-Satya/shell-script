#!/bin/bash
ID=$(id -u)

if [ $ID ne 0];
then 
    echo "Please run with root access"
else
    echo " you are a root user "
fi
