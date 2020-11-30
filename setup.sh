pacman -Syu
echo 'mount /dev/sd /mnt'
echo 'mount -L p_arch /mnt'

pacstrap /mnt base linux linux-firmware dhcpcd nano
genfstab -Lp /mnt > /mnt/etc/fstab
