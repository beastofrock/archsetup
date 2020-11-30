pacman -Syu
echo 'mkfs.ext4 -L p_arch /dev/sdxY'
echo 'mount -L p_arch /mnt'
pacstrap /mnt base linux linux-firmware dhcpcd nano
genfstab -Lp /mnt >> /mnt/etc/fstab
arch-chroot /mnt/
