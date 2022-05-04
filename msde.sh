echo "

copy .config to homefolder -R

"

echo "usermod -aG wheel $USER"

pacman -S \
rofi xorg-server openbox xorg-fonts-misc xorg-xinit tint2 mplayer \
kate pcmanfm feh breeze-gtk neofetch xcompmgr ranger pasystray doas lxappearance \
w3m highlight atool ueberzug neofetch pulseaudio dunst sudo git

echo "setxkbmap de" >> .xinitrc
echo "exec openbox-session" >> .xinitrc

echo "'$HOME'/.bashrc" > .bash_profile
echo "startx" >> .bash_profile

echo 'feh --bg-scale *.jpg' >> .config/openbox/autostart
echo 'tint2 &' >> .config/openbox/autostart
echo 'pasystray &' >> .config/openbox/autostart
echo 'dunst &' >> .config/openbox/autostart
echo 'xcompmgr &' >> .config/openbox/autostart

echo 'set linenumbers' >> .nanorc

echo 'permit :wheel' > /etc/doas.conf
