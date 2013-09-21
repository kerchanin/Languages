#!/usr/bin/env python
# -*- coding: utf-8 -*-

from sikuli.Sikuli import *
import os

def clear_field():
    "Press <Ctrl-A> to select all and then <Del>."
    type('a', KeyModifier.CTRL)
    type(Key.DELETE)

def read_file(filename):
    fd = open(filename, 'r')
    data = fd.read()
    fd.close()
    return data

def remove_file_if_exists(filename):
    if os.path.isfile(filename):
        os.remove(filename)

def write_file(filename, data):
    fd = open(filename, 'w')
    fd.write(data)
    fd.close()
