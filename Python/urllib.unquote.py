#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 2012.09.06
# Done: 21:52 MSK

import sys
from urllib import unquote

s = ''

#http://linux.byexamples.com/archives/343/python-handle-string-from-pipelines-and-list-of-param/
#python: handle string from pipelines and list of param » Linux by Examples
if not sys.stdin.isatty():
    #http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/
    #Urlencode and urldecode from a command line
    #http://ruslanspivak.com/2010/06/02/urlencode-and-urldecode-from-a-command-line/#comment-337
    s = sys.stdin.read().strip()
elif sys.stdin.isatty():
    if sys.argv.__len__() < 2:
        print """Usage: %s <string>
    or
       <pipeline_string> | %s""" % (sys.argv[0], sys.argv[0])
        exit(1)
    else:
        s = sys.argv[1]

print unquote(s)


