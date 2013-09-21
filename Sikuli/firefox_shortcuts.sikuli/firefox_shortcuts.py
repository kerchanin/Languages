#!/usr/bin/env python
# -*- coding: utf-8 -*-

from sikuli.Sikuli import *

"""
http://support.mozilla.org/en-US/kb/keyboard-shortcuts-perform-firefox-tasks-quickly

    Navigation
    Current Page
    Editing
    Search
    Windows & Tabs
    History
    Bookmarks
    Tools
    PDF Viewer
    Miscellaneous
    Media shortcuts (Ogg and WebM Videos Only)
"""

class Navigation(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def back():
        type(Key.LEFT, KeyModifier.ALT)

    @staticmethod
    def forward():
        type(Key.RIGHT, KeyModifier.ALT)

    @staticmethod
    def home():
        type(Key.HOME, KeyModifier.ALT)

    @staticmethod
    def open_file():
        type('o', KeyModifier.CTRL)

    @staticmethod
    def reload():
        type(Key.F5)

    @staticmethod
    def reload_override_cache():
        type(Key.F5, KeyModifier.CTRL)

    @staticmethod
    def stop():
        press(Key.ESC)

class CurrentPage(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def go_to_bottom_of_page():
        pass

    @staticmethod
    def go_to_top_of_page():
        pass

    @staticmethod
    def move_to_next_frame():
        pass

    @staticmethod
    def move_to_previous_frame():
        pass

    @staticmethod
    def print_():
        pass

    @staticmethod
    def save_page_as():
        type('s', KeyModifier.CTRL)

    @staticmethod
    def zoome_in():
        pass

    @staticmethod
    def zoom_out():
        pass

    @staticmethod
    def zoom_reset():
        pass

class Editing(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def copy():
        type('c', KeyModifier.CTRL)

    @staticmethod
    def cut():
        type('x', KeyModifier.CTRL)

    @staticmethod
    def delete():
        pass

    @staticmethod
    def paste():
        type('p', KeyModifier.CTRL)

    @staticmethod
    def paste_as_plain_text():
        pass

    @staticmethod
    def redo():
        pass

    @staticmethod
    def select_all():
        type('a', KeyModifier.CTRL)

    @staticmethod
    def undo():
        pass

class Search(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def find():
        pass

    @staticmethod
    def find_again():
        pass

    @staticmethod
    def find_previous():
        pass

    @staticmethod
    def quick_find_within_linktext_only():
        pass

    @staticmethod
    def quick_find():
        type('/')

    @staticmethod
    def close_the_find_or_quick_find_bar():
        pass

    @staticmethod
    def search_bar():
        pass

    @staticmethod
    def select_or_manage_search_engines():
        pass

class WindowsAndTabs(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def close_tab():
        type('w', KeyModifier.CTRL)
        # or
        #type(Key.F4, KeyModifier.CTRL)

    @staticmethod
    def close_window(shortcut=''):
        if shortcut.lower() != 'Alt-F4'.lower():
            type('w', KeyModifier.CTRL + KeyModifier.SHIFT)
        else:
            type(Key.F4, KeyModifier.ALT)

    @staticmethod
    def move_tab_in_focus_left():
        type(Key.PAGE_UP, Key.KeyModifier.CTRL + KeyModifier.SHIFT)

    @staticmethod
    def move_tab_in_focus_right():
        type(Key.PAGE_DOWN, Key.KeyModifier.CTRL + KeyModifier.SHIFT)

    @staticmethod
    def move_tab_in_focus_to_start():
        type(Key.HOME, KeyModifier.CTRL)

    @staticmethod
    def move_tab_in_focus_to_end():
        type(Key.END, KeyModifier.CTRL)

    @staticmethod
    def new_tab():
        type('t', KeyModifier.CTRL)

    @staticmethod
    def new_window():
        type('n', KeyModifier.CTRL)

    @staticmethod
    def next_tab():
        type(Key.TAB, KeyModifier.CTRL)
        # or
        #type(Key.PAGE_DOWN, KeyModifier.CTRL)

    @staticmethod
    def open_address_in_new_tab():
        type(Key.AL, Key.ENTER)

    @staticmethod
    def previous_tab():
        type(Key.TAB, KeyModifier.CTRL + KeyModifier.SHIFT)
        # or
        #type(Key.PAGE_UP, KeyModifier.CTRL)

    @staticmethod
    def undo_close_tab():
        type('t', KeyModifier.CTRL + KeyModifier.SHIFT)

    @staticmethod
    def undo_close_tab():
        type('n', KeyModifier.CTRL + KeyModifier.SHIFT)

    @staticmethod
    def select_tab1():
        type('1', KeyModifier.CTRL)

    @staticmethod
    def select_tab2():
        type('2', KeyModifier.CTRL)

    @staticmethod
    def select_tab3():
        type('3', KeyModifier.CTRL)

    @staticmethod
    def select_tab4():
        type('4', KeyModifier.CTRL)

    @staticmethod
    def select_tab5():
        type('5', KeyModifier.CTRL)

    @staticmethod
    def select_tab6():
        type('6', KeyModifier.CTRL)

    @staticmethod
    def select_tab7():
        type('7', KeyModifier.CTRL)

    @staticmethod
    def select_tab8():
        type('8', KeyModifier.CTRL)

    @staticmethod
    def select_last_tab():
        type('9', KeyModifier.CTRL)

    @staticmethod
    def tab_groups_view():
        type('e', KeyModifier.CTRL + KeyModifier.SHIFT)

    @staticmethod
    def next_tab_group():
        type('`', KeyModifier.CTRL)

    @staticmethod
    def previous_tab_group():
        type('`', KeyModifier.CTRL, KeyModifier.SHIFT)

class Tools(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def page_source():
        type('u', KeyModifier.CTRL)

class Miscellaneous(object):
    """

    """

    def __init__(cls):
        pass

    @staticmethod
    def select_location_bar():
        type('d', KeyModifier.ALT)
