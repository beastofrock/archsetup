pacman -Syu
#cfdisk
#gdisk
mkfs.ext4 -L p_arch /dev/sdxY
mount -L p_arch /mnt
pacstrap /mnt base linux linux-firmware dhcpcd nano git
genfstab -Lp /mnt >> /mnt/etc/fstab
arch-chroot /mnt/
