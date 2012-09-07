#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 2012.07.31

import sys
import __builtin__

names = sys.builtin_module_names

for name in names:
    module = __builtin__.__import__(name)
    print name
    print '-' * name.__len__()
    print
    print module.__doc__
    print
    print '#' * 83
    del module

    

    
    
