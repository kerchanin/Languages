#!/bin/bash

#initrd.img-2.6.31-14-generic
#vmlinuz-2.6.31-14-generic

#Netboot install
#http://mirror.yandex.ru/debian/dists/stable/main/installer-i386/current/images/netboot/debian-installer/i386/

#http://mirror.yandex.ru/debian/dists/stable/main/installer-i386/current/images/netboot/gtk/debian-installer/i386/
grep '\--gtk' <<< $1 && GTK=gtk/

sudo wget -d -S -O /boot/initrd.img-9.9.99-99-netinstall \
  http://mirror.yandex.ru/debian/dists/stable/main/installer-i386/current/images/netboot/${GTK}debian-installer/i386/initrd.gz

sudo wget -d -S -O /boot/vmlinuz-9.9.99-99-netinstall \
  http://mirror.yandex.ru/debian/dists/stable/main/installer-i386/current/images/netboot/${GTK}debian-installer/i386/linux

sudo update-grub

