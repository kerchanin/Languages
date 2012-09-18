#!/bin/bash
# 2012.03.22

#Music
 #/usr/sbin/alsa
aptitude install alsa-base #sound
aptitude install mpg123 #sound
aptitude install vorbis-tools #sound
aptitude install moc #sound

#Video
aptitude install libav-tools #video

#X Window System (X.Org)
# X Window System (X.Org) infrastructure
# x11-common contains the filesystem infrastructure required for further
# installation of the X Window System in any configuration; it does not provide a
# full installation of clients, servers, libraries, and utilities required to run
# the X Window System.
#
# A number of terms are used to refer to the X Window System, including "X", "X
# Version 11", "X11", "X11R6", and "X11R7".  The version of X used in Debian is
# derived from the version released by the X.Org Foundation, and is thus often
# also referred to as "X.Org".  All of the preceding quoted terms are
# functionally interchangeable in an Debian system.
aptitude install --without-recommends x11-common #x11
# X11 XKB utilities
# xkbutils contains a number of client-side utilities for XKB, the X11 keyboard extension.
# setxkbmap is a tool to query and change the current XKB map.
# xkbbell generates a bell event through the keyboard.
# xkbcomp is a tool to compile XKB definitions into map files the server can use.
# xkbevd is an experimental tool to listen for certain XKB events and execute defined triggers when actions occur.
# xkbprint is a tool to generate an image with the physical representation of the keyboard as XKB sees it.
# xkbvleds shows the changing status of keyboard LEDs.
# xkbwatch shows the changing status of modifiers and LEDs.
 #/usr/bin/xkbcomp
 #/usr/bin/xkbbell
 #/usr/bin/xkbevd
 #/usr/bin/xkbvleds
 #/usr/bin/xkbprint
 #/usr/bin/setxkbmap
 #/usr/bin/xkbwatch
aptitude install --without-recommends x11-xkb-utils #x11
# common files used by various X servers
# This package provides files necessary for all X.Org based X servers.
aptitude install --without-recommends xserver-common #x11
# Xorg X server - core server
# The Xorg X server is an X server for several architectures and operating
# systems, which is derived from the XFree86 4.x series of X servers.
#
# The Xorg server supports most modern graphics hardware from most vendors, and
# supersedes all XFree86 X servers.
#
# More information about X.Org can be found at: <URL:http://www.X.org>
#
# This package is built from the X.org xserver module.
 #/usr/bin/Xorg
 #/usr/bin/gtf
 #/usr/bin/cvt
aptitude install --without-recommends xserver-xorg-core #x11
# X.Org X server -- evdev input driver
# This package provides the driver for input devices using evdev, the Linux
# kernel's event delivery mechanism.  This driver allows for multiple keyboards
# and mice to be treated as separate input devices.
#
# More information about X.Org can be found at: <URL:http://www.X.org>
#
# This package is built from the X.org xf86-input-evdev driver module.
 #/usr/lib/xorg/modules/input/evdev_drv.so
aptitude install xserver-xorg-input-evdev #x11
# X.Org X server -- Nouveau display driver
# This driver for the X.Org X server (see xserver-xorg for a further description)
# provides support for NVIDIA Riva, TNT, GeForce, and Quadro cards.
#
# This package provides 2D support including EXA acceleration, Xv and RandR.  3D
# functionality is provided by the libgl1-mesa-dri package.
#
# This package is built from the FreeDesktop.org xf86-video-nouveau driver.
# Homepage: http://nouveau.freedesktop.org/wiki/
 #/usr/lib/xorg/modules/drivers/nouveau_drv.so
aptitude install xserver-xorg-video-nouveau #x11
#aptitude install xserver-xorg-video-nv #x11
#aptitude install xserver-xorg-video-fbdev #x11
# free implementation of the OpenGL API -- DRI modules
# This version of Mesa provides GLX and DRI capabilities: it is capable of both
# direct and indirect rendering.  For direct rendering, it can use DRI modules
# from the libgl1-mesa-dri package to accelerate drawing.
#
# This package does not include the OpenGL library itself, only the DRI modules
# for accelerating direct rendering.
#
# For a complete description of Mesa, please look at the libgl1-mesa-swx11
# package.
#
# The tdfx DRI module needs libglide3 to enable direct rendering.
# Homepage: http://mesa3d.sourceforge.net/
 #/usr/lib/i386-linux-gnu/dri/nouveau_dri.so
 #/usr/lib/i386-linux-gnu/dri/swrast_dri.so
 #/usr/lib/i386-linux-gnu/dri/r300_dri.so
 #/usr/lib/i386-linux-gnu/dri/r600_dri.so
 #/usr/lib/i386-linux-gnu/dri/i915_dri.so
 #/usr/lib/i386-linux-gnu/dri/radeon_dri.so
 #/usr/lib/i386-linux-gnu/dri/i965_dri.so
 #/usr/lib/i386-linux-gnu/dri/r200_dri.so
 #/usr/lib/i386-linux-gnu/dri/vmwgfx_dri.so
 #/usr/lib/i386-linux-gnu/dri/nouveau_vieux_dri.so
aptitude install --without-recommends libgl1-mesa-dri #libs
# free implementation of the OpenGL API -- Extra DRI modules
# This version of Mesa provides GLX and DRI capabilities: it is capable of both
# direct and indirect rendering.  For direct rendering, it can use DRI modules
# from the libgl1-mesa-dri package to accelerate drawing.
#
# This package does not include the OpenGL library itself, only the DRI modules
# for accelerating direct and indirect rendering.  The drivers in this package
# may provide more features than the drivers in the libgl1-mesa-dri at the cost
# of less stability.
#
# For a complete description of Mesa, please look at the libgl1-mesa-swx11
# package.#
# Homepage: http://mesa3d.sourceforge.net/
aptitude install --without-recommends libgl1-mesa-dri-experimental #libs
# Encodings for X.Org fonts
# This package contains the encodings that map to specific characters.
aptitude install --without-recommends xfonts-encodings #fonts
# X Window System font utility programs
# xfonts-utils provides a set of utility programs shipped with the X Window
# System that are needed for font management.
# .
# The programs in this package include:
#  - bdftopcf, which converts BDF fonts to PCF fonts;
#  - bdftruncate and ucs2any, tools to generate fonts with various encodings
#    from ISO 10646-encoded fonts
#  - mkfontdir, a program to generate fonts.dir files;
#  - mkfontscale, a program to generate fonts.scale files;
#  - fonttosfnt, a program to wrap bitmap fonts in a sfnt (TrueType) wrapper.
 #/usr/bin/mkfontdir
 #/usr/bin/ucs2any
 #/usr/bin/bdftopcf
 #/usr/bin/mkfontscale
 #/usr/bin/bdftruncate
 #/usr/bin/fonttosfnt
 #/usr/sbin/update-fonts-alias
 #/usr/sbin/update-fonts-scale
 #/usr/sbin/update-fonts-dir
aptitude install --without-recommends xfonts-utils #x11
# standard fonts for X
# xfonts-base provides a standard set of low-resolution bitmapped fonts.  In
# most cases it is desirable to have the X font server (xfs) and/or an X server
# installed to make the fonts available to X clients.
aptitude install --without-recommends xfonts-base #fonts
aptitude install xterm #x11
aptitude install sudo #admin
aptitude install htop #utils
aptitude install lsof #utils
aptitude install --without-recommends strace #utils
aptitude install --without-recommends ltrace #utils
aptitude install --without-recommends vim #editors
aptitude install vim-doc #doc

#Archievers
aptitude install --without-recommends bzip2 #utils
aptitude install --without-recommends unzip #utils
aptitude install --without-recommends zip #utils
aptitude install --without-recommends unrar #non-free/utils
aptitude install --without-recommends rar #non-free/utils
aptitude install --without-recommends p7zip-full #utils

#Mozilla Firefox
aptitude install python-xpcom #python
aptitude install hicolor-icon-theme #misc

#Opera
aptitude install gstreamer0.10-plugins-base #libs
aptitude install gstreamer0.10-plugins-good #libs
aptitude install ttf-liberation #oldlibs
echo 'deb http://deb.opera.com/opera/ stable non-free #Opera Browser (final releases)' >> /etc/apt/sources.list
echo >> /etc/apt/sources.list
echo 'deb http://deb.opera.com/opera-beta/ stable non-free #Opera Browser (beta releases)' >> /etc/apt/sources.list
wget -O - http://deb.opera.com/archive.key | apt-key add -
aptitude install opera #non-free/web

#GNOME
aptitude install --without-recommends nautilus #gnome
aptitude install --without-recommends metacity #x11
aptitude install --without-recommends gnome-panel #gnome
aptitude install --without-recommends gtk2-engines #gnome
aptitude install --without-recommends gnome-themes #gnome
aptitude install --without-recommends file-roller #gnome

#Pidgin
aptitude install --without-recommends pidgin #net

#Fonts
aptitude install fonts-cantarell #fonts
aptitude install ttf-bitstream-vera #fonts

#LibreOffice
aptitude install --without-recommends libreoffice-calc #editors
aptitude install --without-recommends libreoffice-writer #editors
aptitude install --without-recommends libreoffice-gtk #gnome
aptitude install --without-recommends libreoffice-gtk3 #gnome
aptitude install --without-recommends libreoffice-gnome #gnome
aptitude install libreoffice-style-tango #editors
aptitude install libreoffice-l10n-ru

#SQLite 3
aptitude install sqlite3 #database
aptitude install sqlitebrowser #database
#aptitude install sqlite3-doc #doc

#Perl
 #LWP
 #LWP::Authen::Ntlm
 #LWP::ConnCache
 #LWP::Debug
 #LWP::MediaTypes
 #LWP::MemberMixin
 #LWP::Protocol
 #LWP::Protocol::https
 #LWP::RobotUA
 #LWP::Simple
 #LWP::UserAgent
 #
 #/usr/bin/lwp-dump
 #/usr/bin/lwp-download
 #/usr/bin/lwp-mirror
 #/usr/bin/lwp-request
 #/usr/bin/GET
 #/usr/bin/POST
 #/usr/bin/HEAD
aptitude install --without-recommends libwww-perl #perl

#Git
aptitude install --without-recommends git #vcs
#aptitude install gitmagic #doc

#Ruby
aptitude install --without-recommends ruby rubygems #ruby
aptitude install --without-recommends ruby #ruby
aptitude install --without-recommends ruby-dev #ruby

#Gems
#For Nokigiri which is for Mechanize :)
#As John Barnette once said, "Isn't package management convenient? :)"
aptitude install --without-recommends libxml2-dev #libdevel
aptitude install --without-recommends libxslt-dev #libdevel
#Stop callin', stop callin' I don't wanna talk anymore!
gem install nokogiri
#This is again for something . /* Stop telephonin' me */
aptitude install --without-recommends g++ #devel
gem install mechanize

#Python
aptitude install --without-recommends python-dev #python
aptitude install --without-recommends python-setuptools #python
aptitude install --without-recommends python-pip #python

