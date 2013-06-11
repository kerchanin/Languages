#!/bin/bash
# 2012.08.26
# 02:34

#GET 'http://grooving.me/tunein_ch1.m3u'
#mplayer 'http://grooving.me:8000/stream'

export SDL_VIDEODRIVER=dummy
ffplay 'http://grooving.me:8000/stream' > /dev/null 2>&1 &
