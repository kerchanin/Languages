#!/bin/bash
# 2012.08.16

#
#http://sourceforge.net/projects/corefonts/files/corefonts/1.3/
#http://sourceforge.net/projects/corefonts/files/corefonts/1.3/msttcorefonts-1.3-4.spec/download
#http://downloads.sourceforge.net/project/corefonts/corefonts/1.3/msttcorefonts-1.3-4.spec?r=http%3A%2F%2Fsourceforge.net%2Fprojects%2Fcorefonts%2Ffiles%2Fcorefonts%2F1.3%2F&ts=1345068326&use_mirror=citylan
#http://citylan.dl.sourceforge.net/project/corefonts/corefonts/1.3/msttcorefonts-1.3-4.spec
#

#
#Commented.
#

#%define distserver http://belnet.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://flow.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://easynews.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://unc.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://umn.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://twtelecom.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://aleron.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://cesnet.dl.sourceforge.net/sourceforge/corefonts
#%define distserver http://switch.dl.sourceforge.net/sourceforge/corefonts

#
#http://citylan.dl.sourceforge.net/project/corefonts/the%20fonts/final/wd97vwr32.exe
#
distserver=http://citylan.dl.sourceforge.net/project/corefonts/the%20fonts/final

name=msttcorefonts

mkdir ${name}
cd ${name}

for i in andale32.exe webdin32.exe trebuc32.exe georgi32.exe verdan32.exe comic32.exe arialb32.exe impact32.exe arial32.exe times32.exe courie32.exe
do
	wget ${distserver}/$i
done

#
#Another way.
#
#distserver= http://sourceforge.net/projects/corefonts/files/the%20fonts/final/
#
#for i in andale32.exe webdin32.exe trebuc32.exe georgi32.exe verdan32.exe comic32.exe arialb32.exe impact32.exe arial32.exe times32.exe courie32.exe
#do
#	wget ${distserver}/$i/download -O $i
#done
#

#
#Commented.
#Because.
#
#Resolving download.microsoft.com (download.microsoft.com)... 64.209.77.41, 64.209.77.19
#Connecting to download.microsoft.com (download.microsoft.com)|64.209.77.41|:80... connected.
#HTTP request sent, awaiting response... 404 Not Found
#2012-08-16 01:41:52 ERROR 404: Not Found.
#

#has_windows_license="yes"

#if test "yes" = ${has_windows_license}
#then
#	wget http://download.microsoft.com/download/ie6sp1/finrel/6_sp1/W98NT42KMeXP/EN-US/IELPKTH.CAB
#fi

mkdir cab-contents

for i in *.exe *.CAB
do
	if test -f $i
	then
		cabextract --lowercase --directory=cab-contents $i
                #
                #cabextract --directory=cab-contents $i
                #
	fi
done

mkdir fonts
cd fonts

cp ../cab-contents/*.ttf .

#
#Commented.
#

#ttmkfdir=/usr/bin/ttmkfdir
#${ttmkfdir} > fonts.dir

#fontdir=/usr/share/fonts/${name}

#%install
#[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT
#cd %{name}/fonts
#mkdir -p $RPM_BUILD_ROOT/%{fontdir}
#cp *.ttf fonts.dir $RPM_BUILD_ROOT/%{fontdir}

#%clean
#[ "$RPM_BUILD_ROOT" != "/" ] && rm -rf $RPM_BUILD_ROOT

#if test $1 -eq 1
#then
#	/usr/sbin/chkfontpath --add ${fontdir}
#fi

# something has probably changed, update the font-config cache
#if test -x /usr/bin/fc-cache
#then
#	/usr/bin/fc-cache
#fi

#if test $1 -eq 0
#then
#	/usr/sbin/chkfontpath --remove ${fontdir}
#fi
