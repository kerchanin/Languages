#!/usr/bin/env ruby

#Works without headers at all, without User-Agent,
#  even without ctl00$ContentPlaceHolder1$ctl00$chkRemember
#    , but
#      __EVENTTARGET must be set!

require 'open-uri'
require 'nokogiri'
require 'mechanize'
require 'logger'

page = open('http://www.bettingadvice.com/login.aspx')

#Nokogiri::HTML::Document
doc = Nokogiri::HTML(page)
puts doc.class

#Nokogiri::XML::NodeSet
nodeset = doc.css('input')
#nodeset = doc.xpath('//form//input')
puts nodeset.class
puts nodeset.length

#Nokogiri::XML::Element
nodeset.each do |node|
  begin
    puts node['name'] #,node['value']
  rescue
    puts node['name']
  end
end

#By names.
#'__VIEWSTATE'
__VIEWSTATE = doc.xpath("//form//input[@name='__VIEWSTATE']")[0][:value]
#'__EVENTVALIDATION'
__EVENTVALIDATION = doc.xpath("//form//input[@name='__EVENTVALIDATION']")[0][:value]
#'ctl00$ContentPlaceHolder1$ctl00$txtUsername'
ctl00_ContentPlaceHolder1_ctl00_txtUsername = doc.xpath("//form//input[@name='ctl00$ContentPlaceHolder1$ctl00$txtUsername']")[0][:value]
#'ctl00$ContentPlaceHolder1$ctl00$txtPassword'
ctl00_ContentPlaceHolder1_ctl00_txtPassword = doc.xpath("//form//input[@name='ctl00$ContentPlaceHolder1$ctl00$txtPassword']")[0][:value]
#'ctl00$ContentPlaceHolder1$ctl00$chkRemember'
ctl00_ContentPlaceHolder1_ctl00_chkRemember = doc.xpath("//form//input[@name='ctl00$ContentPlaceHolder1$ctl00$chkRemember']")[0][:value]

url = 'http://www.bettingadvice.com/login.aspx'

agent = Mechanize.new do |a|
  a.log = Logger.new(STDOUT)
end

data = {

#ctl00$ScriptManager1
#'ctl00$ScriptManager1' => 'ctl00$ContentPlaceHolder1$ctl00$UpdatePanel1|ctl00$ContentPlaceHolder1$ctl00$lbnSubmit',

#Seems that it must!!!
#__EVENTTARGET
'__EVENTTARGET' => 'ctl00$ContentPlaceHolder1$ctl00$lbnSubmit',

#__EVENTARGUMENT
#'__EVENTARGUMENT' => '',

#__VIEWSTATE
'__VIEWSTATE' => __VIEWSTATE,

#__EVENTVALIDATION
'__EVENTVALIDATION' => __EVENTVALIDATION,

#ctl00$ContentPlaceHolder1$ctl00$txtUsername
'ctl00$ContentPlaceHolder1$ctl00$txtUsername' => 'YOUR_USERNAME',

#ctl00$ContentPlaceHolder1$ctl00$txtPassword
'ctl00$ContentPlaceHolder1$ctl00$txtPassword' => 'YOUR_PASSWORD',

#ctl00$ContentPlaceHolder1$ctl00$chkRemember
'ctl00$ContentPlaceHolder1$ctl00$chkRemember' => 'on',

#__ASYNCPOST
#'__ASYNCPOST' => 'true'

}

headers = {
           'Host' => 'www.bettingadvice.com',
           'User-Agent' => 'Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Firefox/17.0',
           'Accept' => 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8',
           'Accept-Language' => 'en-US,en;q=0.5',
           'Accept-Encoding' => 'gzip, deflate',
           'X-Requested-With' => 'XMLHttpRequest',
           'X-MicrosoftAjax' => 'Delta=true',
           'Cache-Control' => 'no-cache,no-cache',
           'Content-Type' => 'application/x-www-form-urlencoded; charset=utf-8',
           'Referer' => 'http://www.bettingadvice.com/login.aspx',
           #'Content-Length' : '32765',
           #'Cookie' => '',
           'Pragma' => 'no-cache',
          }

#=> Mechanize::Page
results = agent.post url, data, headers

#=> String
puts results.body
#=> String
puts results.code
#=> String
puts results.filename
#=> Mechanize::Headers
puts results.response
#=> URI::HTTP
puts results.uri

#pp results

#html_results = Nokogiri::HTML(results.body)

profile = 'http://www.bettingadvice.com/profile.aspx'

results2 = agent.get profile

#pp results2

forum = 'http://forum.bettingadvice.com/'

results3 = agent.get forum

pp results3

