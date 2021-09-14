echo myhost > /etc/hostname
echo LANG=de_DE.UTF-8 > /etc/locale.conf
nano /etc/locale.gen
locale-gen
echo KEYMAP=de-latin1 > /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
echo KEYMAP=de-latin1 >> /etc/vconsole.conf
echo FONT=lat9w-16 >> /etc/vconsole.conf
nano /etc/pacman.conf
pacman -Sy
mkinitcpio -p linux
useradd rt
mkdir -p /home/rt
chown -R rt:rt /home/rt
passwd rt
echo 'now set root-password'
passwd
systemctl enable dhcpcd
