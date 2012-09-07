#!/usr/bin/env python
# -*- coding: utf-8 -*-

from email.utils import formatdate
from random import randint
import time
from email.mime.text import MIMEText
#from email.mime.multipart import MIMEMultipart
from email.header import Header
from email.utils import make_msgid
#from email.generator import _make_boundary
import smtplib

def shiftdate():
    """Only send from 9:00 till 18:00"""
    #formatdate(timeval=None, localtime=False, usegmt=False)
    #Thu, 05 Jul 2012 22:11:35 +0400
    realDate = formatdate(localtime=True)

    #22
    realHour = realDate[-14:-12]
    #formatedate() returns a string.
    realHour = int(realHour)

    if (
        realHour >= 9
        and
        realHour <= 17
       ):
        return realDate

    elif (
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
        return shiftedDate

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
        #timeval = time.time() - 60 * 60 * shift
        shiftedDate = formatdate(time.time() - 60 * 60 * shift, localtime=True)
        return shiftedDate

#No russian letters! header.Header() doesn't work.
charset = 'utf-8'
encoding = 'utf-8'
fromaddr = '<sender@example.org>'
toaddr = ''
toaddrs = ['<recipient@example.org>']

#Subject.
subject = 'Subject'

#Message text.
text = """

Message body.

"""

#Signature.
signature = """
--
Surname Name
Country, City
Phone Number
"""

#All together.
text += signature

#Message constructor.
msg = MIMEText(_text=text, _subtype='plain', _charset=charset)
msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = Header(subject, encoding)
msg['Message-ID'] = make_msgid()
msg['Date'] = shiftdate()

#Excepteion logging.
exception_count = 0
sender_refused_count = 0
connection_exception_count = 0
authentication_exception_count = 0

#toaddrs.reverse()
while toaddrs.__len__() != 0:

    #Send multiple messages via one SMTP session?
    does_times = randint(0, 1)

    #The number of messages via one SMTP session.
    times = 1
    if does_times:
        times = randint(1, min(5, toaddrs.__len__()))

    #SMTP constructor.
    server = smtplib.SMTP()
    server.connect()
    server.ehlo()
    
    #Send some messages via one SMTP session.
    while times != 0:
        toaddr = toaddrs.pop()

        #message.Message.set_boundary(self, boundary)
        #msg.set_boundary(_make_boundary())

        #message.Message.replace_header(self, _name, _value)
        msg.replace_header('To', toaddr)
        msg.replace_header('Message-ID', make_msgid())
        msg.replace_header('Date', shiftdate())
        
        if 'mail.ru' in toaddr.split('@').__getitem__(1).lower():
            #Hello Mail.ru!
            msg.add_header('X-Spam', 'Not detected')
            msg.add_header('X-Mras', 'Ok')
            #Optional.
            #msg.add_header('X-Filter-Spam', '0')

        #Finally, send.
        try:
            server.sendmail(fromaddr, toaddr, msg.as_string())
            print toaddr, 'SEND'
            #print msg.as_string()

        #Or research.
        except Exception as exc:
        
            #To much exceptions?
            print exc
            exception_count += 1
            exc_type = type(exc)

            #raise SMTPRecipientsRefused(senderrs)
            if exc_type == smtplib.SMTPRecipientsRefused:
               recipient = exc.recipients.keys().__getitem__(0)
               print recipient, 'REFUSED'

            #raise SMTPSenderRefused(code, resp, from_addr)
            if exc_type == smtplib.SMTPSenderRefused:
               print exc.sender, 'YOU REFUSED'
               sender_refused_count += 1
               if sender_refused_count == 3:
                   server.quit()
                   exit('SENDER REFUSED 3 TIMES. NO MORE SENSE TO SEND ANYMORE.')

            #class SMTPConnectError(SMTPResponseException):
            if exc_type == smtplib.SMTPConnectError:
               connection_exception_count += 1
               if connection_exception_count == 3:
                   server.quit()
                   exit('NO CONNECTION FOR 3 TIMES. GO HOME')

            #class SMTPAuthenticationError(SMTPResponseException):
            if exc_type == smtplib.SMTPAuthenticationError:
               authentication_exception_count += 1
               if authentication_exception_count == 3:
                   server.quit()
                   exit('NO AUTHENTICATION FOR 3 TIMES. BETTER TO PHONE.')

        time.sleep(randint(10, 50))
        times -= 1

    server.quit()
    time.sleep(randint(10, 50))

