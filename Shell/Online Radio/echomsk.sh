#!/bin/bash

export SDL_VIDEODRIVER=dummy
ffplay 'http://radio.memonet.ru:8000/echo.mp3' > /dev/null 2>&1 &
