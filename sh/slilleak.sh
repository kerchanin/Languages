#!/bin/bash

host='http://slil.ru/'
latest=`wget -q -O - http://slil.ru/page/last | \
          grep -E 'http://slil.ru/[0-9]+' --color=auto -m 1 | \
            awk -F'">' '{print $2}' | \
              awk -F'<a href="' '{print $2}' | \
                awk -F'/' '{print $NF}'`
quantity=100
#let previous=latest-quantity
previous=`expr $latest - $quantity`

from=$previous
to=$latest
[ $1 ] && [ $2 ] && [ $1 -le $2] && { from=$1 ; to=$2 ; }

for i in `seq $from $to` ; do
    link=`wget -q -O - ${host}${i} | \
            grep "var link='" | \
              awk -F"var link='" '{print $2}' | \
                tr -d "'" | \
                  tr -d ';' | \
                    tr -d '\015'`
    link=`echo ${link} | iconv -f cp1251 -t utf8`
    url=${host}${link}
    name=`basename "${url}"`
    ext=`echo "${name}" | awk -F'.' '{print $NF}'`

    echo 'NUMBER :' "$i"
    echo 'LINK   :' "$link"
    echo 'URL    :' "$url"
    echo 'NAME   :' "$name"
    echo 'EXT    :' "$ext"
    echo

    #dump_dir=/tmp/dump_dir
    #[ -d "${dump_dir}" ] || mkdir "${dump_dir}"
    #[ -d "${dump_dir}"/"${ext}" ] || mkdir "${dump_dir}"/"${ext}"
    #path="${dump_dir}"/"${ext}"
    #wget -S -O "${path}"/"${name}" "${url}"

done
