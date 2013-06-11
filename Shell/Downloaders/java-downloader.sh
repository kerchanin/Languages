#!/bin/bash
# 2012.08.16
# Done: 17:22

#http://java.com/ru/
#/inc/BrowserRedirect1.jsp?locale=ru
#http://www.java.com/ru/download/manual.jsp?locale=ru
#http://javadl.sun.com/webapps/download/AutoDL?BundleId=65685
#http://sdlc-esd.sun.com/ESD6/JSCDL/jdk/7u5-b06/jre-7u5-linux-i586.tar.gz?AuthParam=1345116933_92bb2babbe1deb8bbad44529cf5de567&GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/7u5-b06/jre-7u5-linux-i586.tar.gz&File=jre-7u5-linux-i586.tar.gz&BHost=javadl.sun.com

#
#Step 1.
#Visit home page.
#Find donload page url.
#

url=http://java.com/
server=http://java.com

href=`wget -q $url -O - | grep Downloads | awk -F\" '{print $2}'`
#echo $href
downloads_url=${server}${href}
#echo $downloads_url

#
#Step 2.
#Visit download page.
#Find bundle url.
#

#<a title=" Download Java software for Linux" href="http://javadl.sun.com/webapps/download/AutoDL?BundleId=65685" onclick="var s=s_gi('sunjava'); s.tra$

bundle_url=`wget -q $downloads_url -O - | \
              grep -m 1 'Linux" href="' | \
                grep -o -E '"\b(http://.*)\b"' | \
                  tr -d '"'`
#echo $bundle_url


#instructions_url=`wget -q $downloads_url -O - | \
#                    grep -m 1 'instructions for Linux" href="' | \
#                      grep -o -E '/.*\.xml'`
#instructions_url=${server}${instructions_url}
#echo $instructions_url
#wget $instructions_url

#
#Step 3.
#Finally download bundle.
#

#
#http://stackoverflow.com/questions/302195/parse-http-response-header-from-wget
#
#The output of wget you are looking for is written on stderr. You must redirect it:
#$ wget -SO- -T 1 -t 1 http://myurl.com:15000/myhtml.html 2>&1 | egrep -i "302"
#
#wget prints the headers to stderr, not to stdout. You can redirect stderr to stdout as follows:
#wget -SO- -T 1 -t 1 http://myurl.com:15000/myhtml.html 2>&1 | egrep -i "302"
#The "2>&1" part says to redirect ('>') file descriptor 2 (stderr) to file descriptor 1 (stdout).
#

#http://sdlc-esd.sun.com/ESD6/JSCDL/jdk/7u5-b06/jre-7u5-linux-i586.tar.gz?AuthParam=1345121156_e0f0740268ca0c0223add4a723200434&GroupName=JSC&FilePath=/ESD6/JSCDL/jdk/7u5-b06/jre-7u5-linux-i586.tar.gz&File=jre-7u5-linux-i586.tar.gz&BHost=javadl.sun.com
#http://sdlc-esd.sun.com/ESD6/JSCDL/jdk/7u5-b06/jre-7u5-linux-i586.tar.gz
#jre-7u5-linux-i586.tar.gz
bundle_name=`basename $(
                        LANG=C wget -S --spider $bundle_url 2>&1 | \
                          grep -m 1 Location | \
                            grep -o -E 'http://.*' | \
                              awk -F'?' '{print $1}'
                       )`
echo $bundle_name

wget -S -d -v $bundle_url -O $bundle_name
