#!/bin/bash
# 2012.03.22

aptitude install xserver-xorg-input-evdev #x11
aptitude install xserver-xorg-video-nouveau #x11
#aptitude install xserver-xorg-video-nv #x11
aptitude install xserver-xorg-video-fbdev #x11
aptitude install xterm #x11
aptitude install sudo #admin
aptitude install htop #utils
aptitude install --without-recommends vim #editors
aptitude install vim-doc #doc

#Archievers
aptitude install --without-recommends bzip2 #utils
aptitude install --without-recommends unzip #utils
aptitude install --without-recommends unrar #non-free/utils
aptitude install --without-recommends rar #non-free/utils
aptitude install --without-recommends p7zip-full #utils

#Mozilla Firefox
aptitude install python-xpcom #python

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

#
#aptitude install make

# Global Menu
# http://frinring.wordpress.com/2009/01/29/mac-style-menubar-for-kde-4-and-others/

# XBar GTK
# https://bbs.archlinux.org/viewtopic.php?id=102568
# http://qiacat.blogspot.com/2009/03/gnome-global-menu-in-kde4.html
# http://code.google.com/p/gnome2-globalmenu/
# http://gnome2-globalmenu.googlecode.com/files/gnome-globalmenu-0.7.4.tar.gz
aptitude install pkg-config #devel
aptitude install libglib2.0-dev #libdevel
aptitude install libgtk2.0-dev #libdevel

# plasma-globalmenu-mod
# http://kde-apps.org/content/show.php/GlobalMenu+Mod+(+Enable+Gnome+%2B+GTKs+)?action=content&content=129006
# http://gitorious.org/plasma-globalmenu-mod/plasma-globalmenu-mod
