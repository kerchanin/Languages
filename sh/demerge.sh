#!/bin/bash
# 2012.07.01 22:20
# Done: 22:43

mkdir ~/emerge-debian
cd ~/emerge-debian

#mkdip -p <dir/subdir>
# Sections.
mkdir -p `grep -E '^Section: ' /var/lib/dpkg/available | \
            sort -u | \
              awk -F'Section: ' '{print $2}' | \
                tr '\012' '\040'`

# Numbers of strings with package titles.
grep  -n -E '^Package' /var/lib/dpkg/available | \
  awk -F: '{print $1}' | \
  tail -n +2 \
    > /tmp/file_demerge
ls /var/lib/dpkg/available | wc -l >> /tmp/file_demerge

# Current package string number.
from=1
for i in `cat /tmp/file_demerge` ; do
# Next package string number.
    to=$i
    let q=to-from
    # File name.
    package=`tail -n +$from /var/lib/dpkg/available | \
               head -n 1 | \
                 awk -F'Package: ' '{print $2}'`
    # Directory name.
    section=`tail -n +$from /var/lib/dpkg/available | \
               head -n 4 | \
                 grep -E '^Section: ' | \
                   awk -F'Section: ' '{print $2}'`
    #echo $package
    #echo $section
    #echo ~/demerge/$section/$package
    tail -n +$from /var/lib/dpkg/available | \
      head -n $q \
        > ~/emerge-debian/"$section"/"$package"
    # Continue with the next package.
    from=$i
#read
done

unlink /tmp/file_demerge

