mkdir -pv /etc/systemd/system/getty@tty1.service.d/
echo '  [Service]
ExecStart=
ExecStart=-/sbin/agetty --autologin rt --noclear tty1 38400' > /etc/systemd/system/getty@tty1.service.d/autologin.conf
systemctl enable getty@tty1.service
systemctl status getty@tty1.service
