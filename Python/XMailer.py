#!/usr/bin/env python
# 2012.08.07

xmailers = [
            'CommuniGate Pro WebUser Interface v.4.3.5',
            'MiniGamesMailer',
            'mPOP Web-Mail 2.19',
            'GameMailer',
            'IPB PHP Mailer',
            'Zoho Mail',
           ]

def print_xmailers():
    for xmailer in xmailers:
        print xmailer

def random_xmailer():
    """Print random X-Mailer."""
    import random
    print random.choice(xmailers)

if __name__ == '__main__':
    print_xmailers()

