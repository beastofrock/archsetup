#!/bin/bash
read -p "Enter files to search: " files
echo $files
cat $files | grep -E -o "([0-9]{1,3}[\.]){3}[0-9]{1,3}" | sort | uniq -c
