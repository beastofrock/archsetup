#!/bin/bash
echo "enter command:"
read whatodo
echo "enter time in seconds:"
read howoften
while true
do $whatodo
sleep $howoften
echo "##########################################################################################"
done
