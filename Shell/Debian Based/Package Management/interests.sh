#!/bin/bash

if [ ! $1 ] ; then { echo "Usage: $0 <package>" ; exit 1 ; } fi
if echo $LANG | grep ru > /dev/null ; then
    cause="интересен для" ;
else
    cause="is interested by"
fi
p=$1
past=""
tabs="    "
echo $p
while [ n != 5 ] ; do {

    if [[ $p == $past ]] ; then
        kill $$
    fi

    past=$past0

    echo "\$p=$p"
    echo "\$word=$word"
    echo "\$past=$past"

    word=$(aptitude why $p | head -1 | awk '{print $3}') > /dev/null
    echo "${tabs}${p} "${cause}" `aptitude why $p | head -1 | awk '{print $2'} | head -1`"
    past0=$p
    p=$(aptitude why $p | awk '{print $2}' | head -1) > /dev/null
    tabs+="    " ;
    # echo "\$p=$p"
    }
done

