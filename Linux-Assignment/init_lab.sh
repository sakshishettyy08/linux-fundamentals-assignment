#!/bin/bash

echo "Update and Upgrade"
apt update && apt upgrade -y

echo "Install"
apt install -y curl wget tree htop git net-tools

echo "Group"
groupadd engineering

echo "User"
useradd devops 
useradd qa 
useradd intern

echo "Add user to group"
usermod -a -G engineering devops
usermod -a -G engineering qa
usermod -a -G engineering intern


default_pass="Welcome@123"
user_name=("devops" "qa" "intern")

for item in "${user_name[@]}"
do
   echo "Applying Default password for $item"
   echo "$item:$default_pass" | chpasswd

   echo "Password Change $item"
   chage -d 0 "$item"
done
 
