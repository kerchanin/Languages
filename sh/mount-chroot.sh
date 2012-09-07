#!/bin/bash

CHROOT=/media/debian

CHROOT=/media/df5d1c99-9702-41c3-bf55-99ffef33a245

sudo mount --bind /dev  ${CHROOT}/dev
sudo mount --bind /dev/pts ${CHROOT}/dev/pts
sudo mount --bind /proc ${CHROOT}/proc
sudo mount --bind /sys  ${CHROOT}/sys

sudo chroot ${CHROOT} bin/bash

