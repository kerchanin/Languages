#!/usr/bin/env python
# -*- coding: utf-8 -*-
# 2012.10.03

import urllib2
from cookielib import CookieJar
import urllib
import lxml.html

import os
import sys
# This forum requires that you wait 5 seconds between searches. Please try again in 3 seconds.
import time
#from time import strfmtime

import smtplib
from email.mime.text import MIMEText
from email.utils import formatdate
from email.header import Header
from email.utils import make_msgid

FILE = 'ids.txt'
# Write in quotes a number to define how many
# posts to parse (up to 25, I hope)
# if there is no previous post ID in fresh posts
# at the `searchid' page.
#
# By default it is up to the last post
# (25-th I hope) at the `searchid' page.
LIMIT = ''
FROM_ADDR = ''
TO_ADDR = ''
HOST = ''
PORT = ''
LOGIN = ''
PASSWORD = ''

#
VB_LOGIN_USERNAME = ''
VB_LOGIN_MD5PASSWORD = ''
VB_LOGIN_MD5PASSWORD_UTF = ''

cj = CookieJar()
opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))

def visit():
    # http://forum.bettingadvice.com/
    forum_url = 'http://forum.bettingadvice.com/'
    headers = {
        'Accept'          : 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Charset'  : 'windows-1251,utf-8;q=0.7,*;q=0.3',
        'Accept-Encoding' : 'gzip,deflate,sdch',
        'Accept-Language' : 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
        'Cache-Control'   : 'max-age=0',
        'Connection'      : 'keep-alive',
        'Host'            : 'forum.bettingadvice.com',
        'User-Agent'      : 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.10 Safari/537.11',
    }
    req = urllib2.Request(url=forum_url, data=None, headers=headers)
    #cj = CookieJar()
    #opener = urllib2.build_opener(urllib2.HTTPCookieProcessor(cj))
    response = opener.open(req, data=None)

def login():
    # http://forum.bettingadvice.com/login.php?do=login 
    login_url = 'http://forum.bettingadvice.com/login.php?do=login'
    headers = {
        'Accept'          : 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Charset'  : 'windows-1251,utf-8;q=0.7,*;q=0.3',
        #'Accept-Encoding' : 'gzip,deflate,sdch',
        'Accept-Language' : 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
        'Cache-Control'   : 'max-age=0',
        'Connection'      : 'keep-alive',
        #'Content-Length' : '205',
        'Content-Type'    : 'application/x-www-form-urlencoded',
        'Host'            : 'forum.bettingadvice.com',
        'Origin'          : 'http://forum.bettingadvice.com',
        'Referer'         : 'http://forum.bettingadvice.com/',
        'User-Agent'      : 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.10 Safari/537.11',
    }
    fields = {
        'do'                       : 'login',
        'vb_login_username'        : VB_LOGIN_USERNAME,
        'cookieuser'               : '1',
        'vb_login_password'        : '',
        's'                        : '',
        'securitytoken'            : 'guest',
        'do'                       : 'login',
        'vb_login_md5password'     : VB_LOGIN_MD5PASSWORD,
        'vb_login_md5password_utf' : VB_LOGIN_MD5PASSWORD_UTF
    }
    data = urllib.urlencode(fields)
    req = urllib2.Request(url=login_url, data=data, headers=headers)
    response = opener.open(req)

def searchid(id):    
    # http://forum.bettingadvice.com/search.php?searchid=33850
    searchid_url = 'http://forum.bettingadvice.com/search.php?searchid=' + id
    headers = {
        'Accept'          : 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Charset'  : 'windows-1251,utf-8;q=0.7,*;q=0.3',
        #'Accept-Encoding' : 'gzip,deflate',
        'Cache-Control'   : 'max-age=0',
        'Accept-Language' : 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
        'Connection'      : 'keep-alive',
        'Host'            : 'forum.bettingadvice.com',
        'User-Agent'      : 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.10 Safari/537.11',
    }
    req = urllib2.Request(url=searchid_url, data=None, headers=headers)
    response = opener.open(req)
    return response.read()
    
def finduser(id):
    #http://forum.bettingadvice.com/search.php?do=finduser&u=33850
    finduser_url = 'http://forum.bettingadvice.com/search.php?do=finduser&u=' + id
    headers = {
        'Accept'          : 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
        'Accept-Charset'  : 'windows-1251,utf-8;q=0.7,*;q=0.3',
        #'Accept-Encoding' : 'gzip,deflate',
        'Cache-Control'   : 'max-age=0',
        'Accept-Language' : 'ru-RU,ru;q=0.8,en-US;q=0.6,en;q=0.4',
        'Connection'      : 'keep-alive',
        'Host'            : 'forum.bettingadvice.com',
        'User-Agent'      : 'Mozilla/5.0 (X11; Linux i686) AppleWebKit/537.11 (KHTML, like Gecko) Chrome/23.0.1271.10 Safari/537.11',
    }
    req = urllib2.Request(url=finduser_url, data=None) #, headers=headers)
    response = opener.open(req)
    return response.read()
    
def html_tree(html_string):
    # <Element html at 0x8cb674c>
    doc = lxml.html.document_fromstring(html_string)
    return doc

def get_name(doc):
    # Name.
    name = doc.xpath('*//span[@class="smallfont"]/a')[0].text_content()
    return name

def get_tables(doc):
    # Get the list of post tables html.
    # <type 'list'>
    table_list = doc.xpath(
      '*//table[@class="tborder"]'
                          )[3:28]
    return table_list

def get_date_and_time(table):
    # May be get some datetime?
    date_time = table.xpath('tr')[0].text_content()
    date_time = date_time.strip()
    date_time = date_time.split('\t')[-1]
    # Gonna take the date.
    # Gonna take the time.
    date, time  = date_time.split(',')
    time = time.strip()
    return (date, time)

# We have threads.
def get_tread_title(table):
    thread_title = table.xpath(
      'tr/td[@class="alt1"]/div/a/strong'
                              )[0].text_content()
    return thread_title

def get_tread_url(table):
    thread_url = table.xpath(
      'tr/td[@class="alt1"]/div/a'
                            )[0].values()[0]
    return thread_url

def get_post_url(table):
    # Post URL.
    post_url = table.xpath(
      'tr/td[@class="alt1"]/div[@class="alt2"]/div[@class="smallfont"]/em/a'
                          )[0].values()[0]
    return post_url

def get_post_id(table):
    # Post ID.
    post_url = table.xpath(
      'tr/td[@class="alt1"]/div[@class="alt2"]/div[@class="smallfont"]/em/a'
                          )[0].values()[0]
    post_id = post_url.split('#post')[-1]
    return post_id

def get_post_title(table):
    # Post Title.
    post_title = table.xpath(
      'tr/td[@class="alt1"]/div[@class="alt2"]/div[@class="smallfont"]/em/a'
                            )[0].text_content().strip()
    return post_title

def get_post_content(table):
    # Content? Wouldn't you?
    post_title = table.xpath(
      'tr/td[@class="alt1"]/div[@class="alt2"]/div[@class="smallfont"]/em/a'
                            )[0].text_content().strip()
    post_content = table.xpath(
      'tr/td[@class="alt1"]/div[@class="alt2"]/div[@class="smallfont"]'
                              )[0].text_content()
    post_content = post_content.strip()
    post_content = post_content.replace(post_title, '')
    post_content = post_content.strip()
    return post_content

def parse_table(table):
    update  = {}
    update['post_id'] = get_post_id(table)
    update['date'] = get_date_and_time(table)[0]
    update['time'] = get_date_and_time(table)[1]
    update['post_title'] = get_post_title(table)
    update['post_content'] = get_post_content(table)
    return update

def logout():
    pass

# Mail.
def mail(update):
    charset = 'utf-8'
    encoding = 'utf-8'
    from_addr = FROM_ADDR or '<fromaddr@example.org>'
    to_addr = TO_ADDR or '<toaddr@example.org>'
    subject = '[' + update['name'] + ']' + ' ' + update['post_title']
    text = update['post_content']
    host = HOST or ''
    port = PORT or ''
    login = LOGIN or ''
    password = PASSWORD or ''
 
    # Message constructor.
    msg = MIMEText(_text=text, _subtype='plain', _charset=charset)
    msg['From'] = fromaddr
    msg['To'] = toaddr
    msg['Subject'] = Header(subject, encoding)
    msg['Message-ID'] = make_msgid()
    msg['Date'] = formatdate()
   
    if 'mail.ru' in to_addr.split('@').__getitem__(1).lower():
        # Hello Mail.ru!
        msg.add_header('X-Spam', 'Not detected')
        msg.add_header('X-Mras', 'Ok')
        # Optional.
        #msg.add_header('X-Filter-Spam', '0')

    # SMTP constructor.
    server = smtplib.SMTP()
    server.connect(host, port)
    server.ehlo()
    server.login(login, password)

    # Finally, send.
    try:
        server.sendmail(from_addr, to_addr, msg.as_string())
        #print msg.as_string()
    # Or research.
    except SMTPSenderRefused as exception:
        print exception
    except SMTPRecipienstRefused as exception:
        print exception
    except SMTPDataError as exception:
        print exception

    server.quit()

file_path = os.path.abspath(sys.argv[0])
directory = os.path.dirname(file_path)
file_path = os.path.join(directory, FILE)
FILE = file_path

def get_profiles_from_file():
    profiles = []
    fd = open(FILE, 'r')
    lines = fd.readlines()
    fd.close()
    for line in lines:
        line = line.strip()
        if line and line[0] in '1234567890':
           profile = line.split('|')
           profiles.append(profile)
    return profiles

# Write changes to disk.
def update_ids(update):
    fd = open(FILE, 'r+')
    lines = fd.readlines()
    # Happy coding.
    #file_name, extension = os.path.splitext(FILE)
    #time = strftime('%d.%m.%y_%H-%M')
    #import shutil
    #shutil.copy(FILE, '%s.%s.BAK%s' % (file_name, time, extension))
    id = update['id']
    id_length = len(id)
    new_lines = []
    #line = ''
    for line in lines:
        if line[:id_length] != id:
            new_lines.append(line)
    line = ''
    for key in ('id', 'name', 'post_id', 'date', 'time'):
        line += update[key]
        line += '|'
    line = line[:-1] + os.linesep
    new_lines.append(line)
    print line
    # Needable? All the comments will go wild.
    new_lines.sort()
    fd.seek(0)
    fd.truncate()
    fd.writelines(new_lines)
    fd.flush()
    fd.close()

# Get IDs from our file.
# By default it is `ids.txt'.
profiles_from_file = get_profiles_from_file()
# If there are no IDs in the file, exit.
if not profiles_from_file:
    exit('NOTHING TO SCAN.' + os.linesep +
         'ADD IDS.')

visit()
login()

for profile_from_file in profiles_from_file:
    # ID to parse its posts.
    id_from_file = profile_from_file[0]
    
    html_string = finduser(id_from_file)
    doc = html_tree(html_string)
   
    # There could be more then one fresh post
    # since the last update.
    tables = get_tables(doc)
    limit = len(tables) or LIMIT
   
    # Last post ID from the file.
    try:
        post_id_from_file = profile_from_file[2]
    # Or nothing, if it is the first time
    # we parse user's posts.
    except IndexError:
        post_id_from_file = ''

    # There will be fresh profiles.
    updates = []

    # Always the same. I hope.
    # So no need to call it each time.
    #
    # Helped to debug last time. 2013.05.04 22:52
    # This forum requires that you wait 5 seconds between searches. Please try again in 3 seconds.
    #print dir(doc)
    #print doc.text_content().encode('utf-8')
    #
    name = get_name(doc)

    # All your base are belong to us.
    for index in range(0, limit):
        table = tables[index]
        post_id = get_post_id(table)
        if post_id == post_id_from_file:
            break
        else:
            update = parse_table(table)
            update['id'] = id_from_file
            update['name'] = name
            print repr(update['time'])
            # 'L.insert(index, object) -- insert object before index'
            updates.insert(0, update)

    # Finally.
    for update in updates:
        #mail(update)
        update_ids(update)
    # This forum requires that you wait 5 seconds between searches. Please try again in 3 seconds.
    time.sleep(5)
#logout()

