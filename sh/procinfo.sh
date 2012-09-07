#!/bin/sh

file="procinfo.txt"
touch $file

# date
echo "date" > $file
echo "****" >> $file
date >> $file
#

echo >> $file

# cpu
echo "cat /proc/cpuinfo" >> $file
echo "*****************" >> $file
echo >> $file
cat /proc/cpuinfo >> $file
#

# memory
echo "cat /proc/meminfo" >> $file
echo "*****************" >> $file
echo >> $file
cat /proc/meminfo >> $file
#

echo >> $file

# video
echo "video" >> $file
echo "*****" >> $file
echo >> $file
lspci | grep VGA >> $file
#

echo >> $file

# pci
echo "lspci" >> $file
echo "*****" >> $file
echo >> $file
lspci >> $file
#

echo >> $file

# usb
echo "lsusb" >> $file
echo "*****" >> $file
echo >> $file
lsusb -t >> $file
#

echo >> $file

# df
echo "df -hT" >> $file
echo "******" >> $file
echo >> $file
df -hT >> $file
#

echo >> $file

# Who am I?
echo "uname" >> $file
echo "*****" >> $file
echo >> $file
for i in s n r v m p i o ; do
    uname -$i >> $file
done
#

echo >> $file

# lsb_release
echo "lsb_release" >> $file
echo "***********" >> $file
echo >> $file
lsb_release -a >> $file
#
