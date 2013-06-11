#!/bin/bash

bitrate=32
# 32 64 128
[ $1 ] && bitrate=$1
export SDL_VIDEODRIVER=dummy
ffplay http://webcast.emg.fm:55655/europaplus$bitrate.mp3 > /dev/null 2>&1 &

