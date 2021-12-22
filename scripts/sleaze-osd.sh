#!/bin/bash
#pacman -S xosd
curl https://onlineradiobox.com/de/sleazerock/playlist/ | grep uell -A2 | awk -v RS='<[^>]+>' -v ORS= '1' | osd_cat live.txt --align center --pos bottom --delay 1
