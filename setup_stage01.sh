pacman -Syu
#cfdisk
#gdisk
#gdisk > o new gpt
#gdisk > n new partition > 512mb ef00 > OK
#mkfs.fat -F 32 -n BOOT /dev/xY
mkfs.ext4 -L p_arch /dev/sdxY
mount -L p_arch /mnt
pacstrap /mnt base linux linux-firmware dhcpcd nano git
genfstab -Lp /mnt >> /mnt/etc/fstab
arch-chroot /mnt/
