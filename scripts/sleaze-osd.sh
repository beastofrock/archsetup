#!/bin/bash
#pacman -S xosd
while true; do curl https://onlineradiobox.com/de/sleazerock/playlist/ | grep uell -A2 | awk -v RS='<[^>]+>' -v ORS= '1' | osd_cat --align center --pos bottom --delay 8; sleep 40; done
