apt update
apt upgrade -y
apt install xinit openbox rdesktop remmina git xterm wget feh -y

mkdir -pv /etc/systemd/system/getty@tty1.service.d/
echo '[Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin rt --noclear tty1 38400' > /etc/systemd/system/getty@tty1.service.d/autologin.conf
systemctl enable getty@tty1.service
#systemctl status getty@tty1.service

echo ' [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx ' > /home/rt/.bash_profile
cat /home/rt/.bash_profile

mkdir /home/rt/.config/openbox
touch /home/rt/.config/openbox/autostart
chmod +x /home/rt/.config/openbox/autostart
chown rt:rt -R /home/rt/.config/openbox
echo '
wget -N -O /home/rt/.local/share/remmina/group_rdp_terminalserver_ts01.remmina https://raw.githubusercontent.com/beastofrock/archsetup/main/thinclientos/ts01.txt
remmina &
feh --bg-max wallpaper.png' > ~/.config/openbox/autostart

/sbin/reboot

