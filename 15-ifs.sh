#!/bin/bash
R="\e[31m"
G="\e[32m"
Y="\e[33m"
N="\e[0m"
file=/etc/passwd
if [ ! -d $file ]
then
    echo -e "$R Source file does not exists $N"
fi
while IFS=":" read -r line username password user_id group_id user_fullname home_dir shell_path
do
    echo "Username: $username"
    echo "Password: $password"
    echo "UserID: $user_id"
    echo "GroupID: $group_id"
    echo "User Full Name: $user_fullname"
    echo "Home Directory: $home_dir"
    echo "Shell Path: $shell_path"


done < $file