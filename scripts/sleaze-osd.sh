#!/bin/bash
#pacman -Ss xosd
#while true; do curl https://onlineradiobox.com/de/sleazerock/playlist/ | grep uell -A1 | awk -v RS='<[^>]+>' -v ORS= '1' | osd_cat --align center --pos bottom --delay 8 --font -adobe-helvetica-bold-*-*-*-34-*-*-*-*-*-*-*; sleep 20; done

while true; do lynx -source https://onlineradiobox.com/de/sleazerock/playlist/ | \
grep Live -A1 | \
awk -v RS='<[^>]+>' -v ORS= '1' | \
osd_cat --align center --pos bottom --delay 8 --font -adobe-helvetica-bold-*-*-*-34-*-*-*-*-*-*-* -c '#009BF9' -O 1; \
sleep 20; \
done
