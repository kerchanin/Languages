dev
===

Shared memory

py
--
**betting**

 * `betting.py` - Crawls all new posts from [http://forum.bettingadvice.com/](http://forum.bettingadvice.com/)
 * `ids.txt` - contains User ID, Name, the most recent Post ID, Post Time, Post Date separated by `|' line by line

`UserAgent.py` by default prints all the User-Agents it knows.

_random_user_agent()_ prints random User-Agent,

_random_user_agent_with_options(platform=None, browser=None)_ prints random User-Agent of selected platform and/or browser.

--
`XMailer.py` by default prints all the X-Mailers it knows.

_random_xmailer()_ prints random X-Mailer.

--
`bultin_module_docstrings.py` prints docstrings of builtin Python modules in a pritty formatted way.

--
`sendmail2toaddrs.py` &mdash; mailer. I used it to send my resume.

--
`shiftDateTest.py`
>"""Only sends from 9:00 till 18:00"""

```
debian@debian:/mnt/docs/dev/py$ ./shiftDateTest.py 

Fri, 07 Sep 2012 18:35:19 +0400
real hour     =  18
shift         =  6
shifted hour  =  12
Fri, 07 Sep 2012 18:35:19 +0400
Fri, 07 Sep 2012 12:35:19 +0400

```

--
`shiftdate.py` contains _shiftdate()_ function to shift date to only send from 9:00 till 18:00.

--
`urllib.quote.py` Now works with pipes!
```
Usage: ./urllib.quote.py <string>
    or
       <pipeline_string> | ./urllib.quote.py
```

--
`urllib.unquote.py` Now works with pipes!
```
Usage: ./urllib.unquote.py <string>
    or
       <pipeline_string> | ./urllib.unquote.py
```

sh
--
`procinfo.sh`

--
`how` Tell me how oh how to do it.
```
Usage: ./how <command>
```

--

`interests.sh`
```
Usage: ./interests.sh <package>
```

`remove`
```
debian@debian:/mnt/docs/dev/sh$ ./remove gnome
     1  gnome-applets-data
     2  gnome-common
     3  gnome-desktop-data
     4  gnome-desktop3-data
     5  gnome-icon-theme
     6  gnome-js-common
     7  gnome-keyring
     8  gnome-menus
     9  gnome-mplayer
    10  gnome-session-common
    11  gnome-settings-daemon
    12  gnome-terminal-data
    13  gnome-themes-standard
    14  libgmlib0:i386
    15  libgmtk0:i386
    16  libgmtk0-data
    17  libgnome-desktop-3-2
    18  libgnome-keyring-common
    19  libgnome-keyring0:i386
    20  libgnome-media-profiles-3.0-0
    21  libgnome-menu-3-0
    22  libgnomekbd-common
    23  libgnomekbd7
    24  libpam-gnome-keyring
    25  libsoup-gnome2.4-1:i386
gnome-applets-data gnome-common gnome-desktop-data gnome-desktop3-data gnome-icon-theme gnome-js-common gnome-keyring gnome-menus gnome-mplayer gnome-session-common gnome-settings-daemon gnome-terminal-data gnome-themes-standard libgmlib0:i386 libgmtk0:i386 libgmtk0-data libgnome-desktop-3-2 libgnome-keyring-common libgnome-keyring0:i386 libgnome-media-profiles-3.0-0 libgnome-menu-3-0 libgnomekbd-common libgnomekbd7 libpam-gnome-keyring libsoup-gnome2.4-1:i386
[sudo] password for debian: 
```

`rc-remove`
```
debian@debian:/mnt/docs/dev/sh$ dpkg -l | grep -E '^rc '
rc  gnome-applets-data                   3.4.1-3                            all          Various applets for the GNOME panel - data files
rc  gnome-menus                          3.4.2-3                            i386         GNOME implementation of the freedesktop menu specification
rc  gnome-session-common                 3.4.2.1-1                          all          GNOME Session Manager - common files
rc  libcpufreq0                          008-1                              i386         shared library to deal with the cpufreq Linux kernel feature
rc  libedataserverui-3.0-1               3.4.3-1                            i386         GUI utility library for evolution data servers
rc  libgnome-media-profiles-3.0-0        3.0.0-1                            i386         GNOME Media Profiles library
rc  libgnome-menu-3-0                    3.4.2-3                            i386         GNOME implementation of the freedesktop menu specification
rc  libgucharmap-2-90-7                  1:3.4.1.1-2                        i386         Unicode browser widget library (shared library)
rc  libpanel-applet-4-0                  3.4.2.1-2+b1                       i386         library for GNOME Panel applets
rc  libsystemd-daemon0:i386              44-4                               i386         systemd utility library
rc  libwebrtc-audio-processing-0:i386    0.1-2                              i386         AudioProcessing module from the WebRTC project.
rc  libwnck-3-0                          3.4.2-1                            i386         Window Navigator Construction Kit - runtime files
rc  libyelp0                             3.4.2-1                            i386         Library for the GNOME help browser
rc  rtkit                                0.10-2                             i386         Realtime Policy and Watchdog Daemon
rc  yelp                                 3.4.2-1                            i386         Help browser for GNOME
debian@debian:/mnt/docs/dev/sh$ ./rc-remove 
Следующие пакеты будут УДАЛЕНЫ:                  
  gnome-applets-data{p} gnome-menus{p} gnome-session-common{p} libcpufreq0{p} libedataserverui-3.0-1{p} libgnome-media-profiles-3.0-0{p} 
  libgnome-menu-3-0{p} libgucharmap-2-90-7{p} libpanel-applet-4-0{p} libsystemd-daemon0{p} libwebrtc-audio-processing-0{p} libwnck-3-0{p} libyelp0{p} 
  rtkit{p} yelp{p} 
0 пакетов обновлено, 0 установлено новых, 15 пакетов отмечено для удаления, и 17 пакетов не обновлено.
Необходимо получить 0 B архивов. После распаковки 0 B будет занято.
Хотите продолжить? [Y/n/?] 
```

--
`mueller7.dict.sh`
```
debian@debian:/mnt/docs/dev/sh/$ ./mueller7.dict.sh love
love
   [lʌv]
   1. _n.
      1) любовь, привязанность; there's no love lost between them они
      недолюбливают друг друга
      2) влюблённость; to be in love (with) быть влюблённым (в); to fall in
      love (with) влюбиться (в); to fall out of love with smb. разлюбить
      кого-л.; to make love to
         а) ухаживать за;
         б) добиваться физической близости; love in a cottage рай в шалаше
      3) любовная интрига; любовная история
      4) предмет любви; дорогой, дорогая; возлюбленный, возлюбленная (особ. в
      обращении my love)
      5) _миф. амур, купидон
      6) что-л. привлекательное; a regular love of a kitten прелестный котёнок
      7) _спорт. нуль; win by four goals to love выиграть со счётом 4:0; love
      all счёт 0:0; love game "сухая"; for the love of ради, во имя; for
      the love of Mike ради бога; not for love or money, not for the love
      of Mike ни за что, ни за какие деньги, ни за какие коврижки; to give
      (to send) one's love to smb. передавать (посылать) привет кому-л.;
      for love of the game из любви к искусству; to play for love играть не
      на деньги; love and a cough cannot be hidden _посл. любви да кашля не
      утаишь
   2. _v.
      1) любить
      2) хотеть, желать; находить удовольствие (в чём-л.); I'd love to come
      with you я бы с удовольствием пошёл с вами

```

--
`clear_history` Place it into your `/etc/cron.hourly/`

--
`mount-chroot.sh`

--
`debian-installer.sh`

`debian-netinstall.sh` Debian minimal package by package installation.

--

`WMakerSession.sh`

`Session.sh`

--
`demerge.sh`

--
`slilleak.sh` 100 latest uploads to http://slil.ru/

--
`msttcorefonts-downloader.sh`

`java-downloader.sh`

--
`europaplus.sh`

`echomsk.sh`

`grooving.sh`

--
`weather.sh` originally by Brainsburn http://zenux.ru/articles/47/

--
`moyareklama_ad_parse_emails.sh` Grab emails from fresh http://www.moyareklama.ru/ ads.

rb
--

`nokogiri.rb` Brand new script to login with aspnetForm via creating new `Mechanize::Form` and submitting it.

`nokogiri-post.rb` Brand new script to login with aspnetForm via researching with `Nokogiri:HTML` and posting data.
