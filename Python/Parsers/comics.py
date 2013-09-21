#!/usr/bin/env python
# -*- coding: utf-8 -*-
import lxml.html
import urllib

BASE_URL = 'http://freelanceswitch.com/category/freelance-freedom/page/'

# <Element div at 0x979762c>
def parse_div(div):
    parsed = {}
    title = div.xpath('h1/a')[0].text_content()
    if 'Freelance Freedom' not in title:
        return
    link = div.xpath('h1/a')[0].values()[0]
    comments = div.xpath('*/div[@class="comments_popup_link"]/a'
      )[0].text_content()
    author = div.xpath('div[@class="clearfix"]/ul/li[1]'
      )[0].text_content().split(' | ')[0]
    category = div.xpath('div[@class="clearfix"]/ul/li[2]/a'
      )[0].text_content()
    date = div.xpath('div[@class="clearfix"]/ul/li[3]/span'
     )[0].text_content()
    image = div.xpath('div[2]/p//img/@src')[0]

    # http://skelliewag.org/wp-content/uploads/2008/03/ff46_writingtechnology.jpg
    # urllib.urlretrieve(image, image_filename)
    download_image(image)

    parsed["title"] = title
    parsed["link"] = link
    parsed["comments"] = comments
    parsed["author"] = author
    parsed["category"] = category
    parsed["date"] = date
    parsed["image"] = image
    return parsed

def download_image(image):
    addinfoururl = urllib.urlopen(image)
    if addinfoururl.code != 404:    
        open(image.split('/')[-1], 'wb').write(addinfoururl.fp.read())
    
for page_index in range(26, 0, -1):
    print page_index
    url = "%s%s/" % (BASE_URL, str(page_index))
    print url
    page = urllib.urlopen(url).read()
    # <Element html at 0x8fef53c>
    doc = lxml.html.document_fromstring(page)
    divs = doc.xpath('//div[@class="post post_bg"]')
    num_blocks = len(divs)

    for div_index in range(num_blocks - 1, -1, -1):
        parsed = parse_div(divs[div_index])
        print url
        print str(div_index)
        print parsed
        print
