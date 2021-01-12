#!/bin/bash
read -p "Enter string to insert at front: " ip
read -p "Enter file: " file

echo $ip
echo $file
sed "s/^/$ip /" $file
