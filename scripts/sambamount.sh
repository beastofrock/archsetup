#!/bin/bash
echo "//server/share"
read -p "Enter share: " share
echo "administratotor"
read -p "Enter username: " username
sudo mount -t cifs $share -o username=$username smbmount/
ls smbmount/
echo #######
df -h
echo ######
