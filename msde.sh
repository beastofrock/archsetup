pacman -S rofi xorg-server openbox xorg-fonts-misc xorg-xinit tint2 mplayer kate pcmanfm feh breeze-gtk
echo "setxkbmap de" >> .xinitrc
echo "exec openbox-session" >> .xinitrc
echo "$HOME/.bashrc" > .bash_profile
echo "startx" >> .bash_profile

