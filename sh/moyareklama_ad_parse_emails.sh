#!/bin/bash
# 2012.09.09
# Done: 11:07

city=''
host='http://www.moyareklama.ru'
startpage="http://www.moyareklama.ru/${city}/работа_вакансии/все"
user_agent='Mozilla/5.0 (X11; Linux i686; rv:17.0) Gecko/17.0 Firefox/17.0'

#5131
found_quantity=`wget -q -O - -U $user_agent "http://www.moyareklama.ru/${city}/работа_вакансии/все" | \
  grep -i 'Найдено' | \
    grep -o -E '[0-9]+'`
echo $found_quantity

#/работа_вакансии/все/8/343
last_relative_url=`wget -q -O - -U 'Mozilla' "http://www.moyareklama.ru/${city}/работа_вакансии/все" | \
  sed 's/<\/a>/<\/a>\n/g' | \
    grep "<a class='page_m' href=\"" | \
      grep -v strelka | \
        tail -n 1 | \
          grep -o -E '".*"' | \
            tr -d '"'`
echo $last_relative_url

#343
last_number=`echo $last_relative_url | awk -F'/' '{print $NF}'`
echo $last_number

#/работа_вакансии/все/8/
relative_url_without_id=`echo $last_relative_url | awk -F'/' 'sub($NF"$","")'`
echo $relative_url_without_id

#http://www.moyareklama.ru/${city}/работа_вакансии/все/8/
absolute_url_without_id=${host}${relative_url_without_id}

#!
cookie_file=cookies_`date +'%Y.%m.%d.%s'`.txt
wget --save-cookies=$cookie_file -U $user_agent --spider $host/${city}/

#ids_2012.09.09.1347173733.txt
id_file=ids_`date +'%Y.%m.%d.%s'`.txt

#${absolute_url_without_id}1
#${absolute_url_without_id}${last_number}
#http://www.moyareklama.ru/${city}/работа_вакансии/все/8/1
#http://www.moyareklama.ru/${city}/работа_вакансии/все/8/343
for id in `seq 1 $last_number` ; do
    url=${absolute_url_without_id}$id
    #/single_ad_new.php?id=
    wget --load-cookies=$cookie_file -U $user_agent $url -O - -q | \
      #grep --color=auto -o -E '/single_ad_new\.php\?id=[0-9]{1,15}' | tee -a $id_file
      grep --color=auto -o -E '/single_ad_new\.php\?id=[0-9]{1,15}' >> $id_file
done

sed -i 's/^/http:\/\/www.moyareklama.ru/g' $id_file
#cat $id_file

#emails_2012.09.09.1347174000.txt
email_file=emails_`date +'%Y.%m.%d.%s'`.txt

for url in `cat $id_file` ; do
    wget --load-cookies=$cookie_file -U $user_agent $url -O - -q | \
      grep --color=auto -o -i -E '\b[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,10}\b' | sort -u | tee -a $email_file
done

#
sort -u $email_file > $email_file.tmp
mv $email_file.tmp $email_file

