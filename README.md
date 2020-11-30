# archsetup

pacman -S - < xfce4-packages.list

usermod -aG wheel rt

https://aur.archlinux.org/brave-bin.git

https://aur.archlinux.org/yay.git

# startx starting xfce4:
echo 'exec xfce4-session' > /home/rt/.xinitrc
# autostart after login:
echo 'exec startx' > /home/rt/.bash_profile


/etc/systemd/system.conf
DefaultTimeoutStopSec=10s

https://icon-icons.com/downloadimage.php?id=145482&root=2389/SVG/&file=arch_linux_logo_icon_145482.svg
