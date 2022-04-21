pacman -S \
rofi xorg-server openbox xorg-fonts-misc xorg-xinit tint2 mplayer \
kate pcmanfm feh breeze-gtk neofetch xcompmgr ranger pasystray doas lxapperance \
w3m highlight atool ueberzug neofetch pulseaudio 



echo "setxkbmap de" >> .xinitrc
echo "exec openbox-session" >> .xinitrc

echo "$HOME/.bashrc" > .bash_profile
echo "startx" >> .bash_profile

echo 'feh --bg-scale *.jpg' >> .config/openbox/autostart
echo 'tint2 &' >> .config/openbox/autostart
echo 'pasystray &' >> .config/openbox/autostart
echo 'xcompmgr &' >> .config/openbox/autostart

ehco 'set linenumbers' >> .nanorc

echo 'permit :wheel' > /etc/doas.conf
