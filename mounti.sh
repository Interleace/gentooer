#!/bin/bash
# Mounted und wechselt chroot für Testzwecke mit grub/efi

# Wenn root die 4. Partition ist
mount /dev/sda4 /mnt/gentoo

mount --types proc /proc /mnt/gentoo/proc
mount --rbind /sys /mnt/gentoo/sys
mount --make-rslave /mnt/gentoo/sys
mount --rbind /dev /mnt/gentoo/dev
mount --make-rslave /mnt/gentoo/dev
printf "Alles mounted\n"

env -i HOME=/root TERM=$TERM chroot . bash -l
export PS1="(chroot) $PS1"

printf "DONE!\n"