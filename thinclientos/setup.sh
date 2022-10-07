apt update
apt install xinit openbox rdesktop remmina github xterm


mkdir -pv /etc/systemd/system/getty@tty1.service.d/
echo '[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin rt --noclear tty1 38400' > /etc/systemd/system/getty@tty1.service.d/autologin.conf
systemctl enable getty@tty1.service
systemctl status getty@tty1.service

echo ' [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx ' >> ~/.bash_profile
cat ~/.bash_profile


echo '
wget -N -O /home/rt/.local/share/remmina/group_rdp_terminalserver_ts01.remmina http://ts01/ts01.txt  
remmina &
feh --bg-max wallpaper.png' > ~/.config/openbox/autostart
chmod +x ~/.config/openbox/autostart


wget -N -O /home/rt/.local/share/remmina/group_rdp_terminalserver_ts01.remmina http://ts01/ts01.txt  
remmina &
feh --bg-max wallpaper.png
