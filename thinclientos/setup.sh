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


mkdir -p ~/.config/openbox
echo 'wget http://ts01/verbindung.txt -E 
echo 'remmina &' > ~/.config/openbox/autostart
chmod +x ~/.config/openbox/autostart


