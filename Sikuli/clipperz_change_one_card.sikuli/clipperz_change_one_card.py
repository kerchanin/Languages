# -*- coding: utf-8 -*-
# 2013.09.21

setShowActions(True)
click("1379770394281.png")

def edit_one_card():
    #target = find("1379769618078.png")
    target = find("1379781003263.png")
    y = 0
    y = y + 10 - 10
    click(target.getCenter().offset(0, y))    
    wait("1379769644699.png")
    #click("1379769644699.png")
    
    # To the site
    target2 = find("1379769733329.png")
    click(target2.getCenter().offset(0, 20))
    wait(1)
    click("1379769971787.png")
    #type('u', KeyModifier.CTRL)
    click("1379769971787.png")
    #type('f', KeyModifier.CTRL)
    #type("<title>")
    #title = input()
    #if input:
    #    click("1379769971787.png")
    #    type('w', KeyModifier.CTRL)
    #    click("1379769971787.png")
    #    type('w', KeyModifier.CTRL)
    #click("1379769971787.png")
    
    # Title.
    type(Key.F12)
    wait(2)
    # wait("1379771445870.png")
    # click("1379771445870.png")
    #click(find("1379772067937.png").getCenter().targetOffset(0,20))
    paste("window.prompt('Copy to clipboard: Ctrl+C, Enter', document.title);")
    type('\n')
    type('c', KeyModifier.CTRL)
    ok = find("1379771647959.png")
    click(ok.getCenter())
    click("1379769971787.png")
    type('w', KeyModifier.CTRL)    
    wait("1379769644699.png")
    
    # Ready to edit.
    click("1379769644699.png")
    wait("1379770496208.png")
    target3 = find("1379770534019.png")
    click(target3.getCenter().offset(0, 20))
    for j in range(1,50) : type(Key.BACKSPACE)
    #type(title)
    #for j in range(1,50) : type(Key.BACKSPACE)
    type("v", KeyModifier.CTRL)
    target4 = find("1379770654261.png")
    click(target4)
    wait("1379770693132.png")
    click(target4.getCenter().offset(0, -10))
    paste("type")
    type("\t")
    paste("freelance")
    click(find("1379770763844.png"))
    wait("1379769644699.png")

for i in range(1, 2):
    try:
        edit_one_card()
    except:
        pass
