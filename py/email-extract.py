#!/usr/bin/env python
 
"""
Description: extract email addresses from stdin to stdout
Usage example: cat whatever.txt | extract-email.py | sort -fu > addr.txt
"""

import re
import sys
   
email_pattern = re.compile('([\w\-\.]+@(\w[\w\-]+\.)+[\w\-]+)')
    
for line in sys.stdin:
# there are several matches per line
    for match in email_pattern.findall(line):
        print match[0]
