#!/usr/bin/env python
# -*- coding: utf-8 -*-

from email.utils import formatdate
from random import randint
import time

#formatdate(timeval=None, localtime=False, usegmt=False)
#Thu, 05 Jul 2012 22:11:35 +0400
realDate = formatdate(localtime=True)

#22
realHour = realDate[-14:-12]
#formatedate() returns a string.
realHour = int(realHour)

shift = 0
shiftedDate = realDate

if (
    realHour >= 18
    and
    realHour <= 23
   ):
    start = realHour.__sub__(17)
    end = realHour.__sub__(9)
    # Real hour is shifted `shift' hours back.
    shift = randint(start, end)
    #Method 1. String substitution.
    shiftedHour = realHour - shift
    shiftedHour = shiftedHour.__str__()
    #09
    shiftedHour = shiftedHour.zfill(2)
    #Thu, 05 Jul 2012 09:31:28 +0400
    shiftedDate = (
                   #Thu, 05 Jul 2012
                   realDate[0:-14]
                                  +
                   #09
                   shiftedHour
                                  +
                   #:31:28 +0400
                   realDate[-12:]
                  )

    #Method 2. - 60 * 60 * shift
    #Thu, 05 Jul 2012 10:37:42 +0400
    #Thu, 05 Jul 2012 10:37:42 +0400
    shiftedDate = formatdate(time.time() - 60 * 60 * shift, localtime=True)

elif (
      realHour >= 0
      and
      realHour <= 8
     ):
    #24 - 17 = 7
    #08:mm -> 00:mm -> 17:mm
    start = 7  + realHour
    #24 - 9 = 15
    #08:mm -> 00:mm -> 09:mm
    end = 15 + realHour
    # Real hour is shifted `shift' hours back.
    shift = randint(start, end)
    #timeval = time.time() - 60 * 60 * shif
    shiftedDate = formatdate(time.time() - 60 * 60 * shift, localtime=True)

print
print realDate
print 'real hour     = ', realHour
print 'shift         = ', shift
print 'shifted hour  = ', realHour - shift
print shiftedDate
print formatdate(time.time(), localtime=True)
print

