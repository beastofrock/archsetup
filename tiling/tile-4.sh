#!/bin/bash
wmctrl -r :ACTIVE: -b remove,maximized_vert,maximized_horz

if
xrandr | grep connected | grep 1920x1080
then
wmctrl -r :ACTIVE: -e "0,250,150,1500,800"
else
wmctrl -r :ACTIVE: -e "0,190,150,1660,973"
fi
echo "4k        1400"
echo "4ks       1602"
echo "1k        1015"
echo "1ks       1217"
#!/bin/bash
if
xrandr | grep connected | grep 1920x1080
then
echo 1k
else
echo 4k
fi
