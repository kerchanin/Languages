#!/usr/bin/env ruby

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
    puts node['name'] #, node['value']
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
page = agent.get(url)

doc = Nokogiri::HTML::Document.new
form_node = doc.create_element('form')
hidden_node = doc.create_element('hidden')

form = Mechanize::Form.new form_node, agent, page

form.method = 'post'
form.action = 'http://www.bettingadvice.com/login.aspx'

#ctl00$ScriptManager1
#hidden_node['name'] = 'ctl00$ScriptManager1'
#hidden_node['value'] = 'ctl00$ContentPlaceHolder1$ctl00$UpdatePanel1|ctl00$ContentPlaceHolder1$ctl00$lbnSubmit'
#form.fields << Mechanize::Form::Hidden.new(hidden_node)

#__EVENTTARGET
hidden_node['name'] = '__EVENTTARGET'
hidden_node['value'] = 'ctl00$ContentPlaceHolder1$ctl00$lbnSubmit'
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#__EVENTARGUMENT
#hidden_node['name'] = '__EVENTARGUMENT'
#hidden_node['value'] = ''
#form.fields << Mechanize::Form::Hidden.new(hidden_node)

#__VIEWSTATE
hidden_node['name'] = '__VIEWSTATE'
hidden_node['value'] = __VIEWSTATE
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#__EVENTVALIDATION
hidden_node['name'] = '__EVENTVALIDATION'
hidden_node['value'] = __EVENTVALIDATION
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#ctl00$ContentPlaceHolder1$ctl00$txtUsername
hidden_node['name'] = 'ctl00$ContentPlaceHolder1$ctl00$txtUsername'
#hidden_node['value'] = ctl00_ContentPlaceHolder1_ctl00_txtUsername
hidden_node['value'] = 'YOUR_USERNAME'
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#ctl00$ContentPlaceHolder1$ctl00$txtPassword
hidden_node['name'] = 'ctl00$ContentPlaceHolder1$ctl00$txtPassword'
#hidden_node['value'] = ctl00_ContentPlaceHolder1_ctl00_txtPassword
hidden_node['value'] = 'YOUR_PASSWORD'
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#ctl00$ContentPlaceHolder1$ctl00$chkRemember
hidden_node['name'] = 'ctl00$ContentPlaceHolder1$ctl00$chkRemember'
#hidden_node['value'] = ctl00_ContentPlaceHolder1_ctl00_chkRemember
hidden_node['value'] = 'on'
form.fields << Mechanize::Form::Hidden.new(hidden_node)

#__ASYNCPOST
#hidden_node['name'] = '__ASYNCPOST'
#hidden_node['value'] = 'true'
#form.fields << Mechanize::Form::Hidden.new(hidden_node)

#puts form.inspect

#=> Mechanize::Page
results = form.submit

#=> String
#puts results.body
#=> String
#puts results.code
#=> String
#puts results.filename
#=> Mechanize::Headers
#puts results.response
#=> URI::HTTP
#puts results.uri

html_results = Nokogiri::HTML(results.body)

profile = 'http://www.bettingadvice.com/profile.aspx'

r2 = agent.get profile

pp r2

