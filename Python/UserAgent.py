#!/usr/bin/env python
# -*- coding: utf-8 -*-

user_agents = {
      'Windows'   : {
                     'Opera'   : [
                                  'Opera/9.80 (Windows NT 5.1; U; Edition Next; ru) Presto/2.10.255 Version/12.00'
                                 ],
                     'Firefox' : [
                                  'Mozilla/5.0 (Windows NT 5.1; rv:10.0.2) Gecko/20100101 Firefox/10.0.2',
                                  'Mozilla/5.0 (Windows NT 5.1; rv:13.0a1) Gecko/20120215 Firefox/13.0a1'
                                 ],
                     'Chrome'  : [
                                  'Mozilla/5.0 (Windows NT 5.1) AppleWebKit/535.22 (KHTML, like Gecko) Chrome/19.0.1049.3 Safari/535.22'
                                 ]
                    },

      'Linux'     : {
                     'Opera'   : [
                                  'Opera/9.80 (X11; Linux i686; U; ru) Presto/2.10.229 Version/11.61'
                                 ],
                     'Firefox' : [
                                  'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.3) Gecko/20091020 Ubuntu/9.10 (karmic) Firefox/3.5.3',
                                  'Mozilla/5.0 (X11; Linux i686; rv:11.0) Gecko/20100101 Firefox/11.0',
                                  'Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20120321 Firefox/14.0a1'
                                 ],
                     'Iceweasel' : [
                                    'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.16) Gecko/20120315 Iceweasel/3.5.16 (like Firefox/3.5.16)',
                                    'Mozilla/5.0 (X11; U; Linux i686; ru; rv:1.9.1.16) Gecko/20120315 Iceweasel/3.5.16 (like Firefox/3.5.16)'
                                   ],
                     'Chrome'  : [],
                     'w3m'     : [
                                  'w3m/0.5.2'
                                 ]
                    },

     'J2ME/MIDP'   : {
                     'Opera Mini'    : [
                                        'Opera/9.80 (J2ME/MIDP; Opera Mini/4.1.13572/28.2144; U; ru) Presto/2.8.119 Version/11.10'
                                       ]
                    },

     'Python'     : {
                     'Python-urllib' : [
                                        'Python-urllib/2.7'
                                       ]
                    },  

     'Perl'       : {
                     'libwww-perl'   : [
                                        'libwww-perl/6.04'
                                       ],
                     'WWW-Mechanize' : [
                                        'WWW-Mechanize/1.71'
                                       ]
                    }                    
              }

def print_user_agents():
    for platform in user_agents:
        #Linux
        print platform
        print '-' * platform.__len__()
        for browser in user_agents[platform]:
            tabs = ' ' * 4
            #Firefox
            print tabs + browser
            print tabs + '-' * browser.__len__()
            for version in user_agents[platform][browser]:
                tabs = ' ' * 8
                #Mozilla/5.0 (X11; Linux i686; rv:14.0) Gecko/20120321 Firefox/14.0a1
                print tabs + version

def random_user_agent():
    """Print random User-Agent."""
    versions = []
                    #type '<dict'>
    for platform in user_agents:
                       #type <'dict'> 
        for browser in user_agents[platform]:
                           #type <'list'> 
            for version in user_agents[platform][browser]:
                                #type <'str'>  
                versions.append(version)
    import random
    print random.choice(versions)

def random_user_agent_with_options(platform=None, browser=None):
    """Print random User-Agent.
       If defined platform and/or browser,
       print random User-Agent of selected platform and/or browser."""
    versions = []
    platforms = user_agents.keys()
    print platform
    if platform:
        if user_agents.__contains__(platform):
            platforms = [platform]
        else:
            platforms = []
    for platform in platforms:
        browsers = user_agents[platform].keys()
        if browser:
            if user_agents[platform].__contains__(browser):
                browsers = [browser]
            else:
                browsers = []
        for browser in browsers:
            for version in user_agents[platform][browser]:
                versions.append(version)        
    if versions:
        import random
        print random.choice(versions)

if __name__ == '__main__':
    print_user_agents()
