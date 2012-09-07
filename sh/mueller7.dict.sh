#!/bin/bash
# 2012.06.17 15:51
# mueller7.dict.dz
# Done: 16:58

#FILE=/tmp/mueller7.dict
[ -f ../dict/mueller7.dict ]  && FILE=../dict/mueller7.dict || FILE=/home/debian/docs/txt/dict/mueller7.dict

if [ ! $1 ] ; then
    echo "Usage: $0 <english_word>"
    exit 1
fi

# String number from which the word was found.
from=`grep -E "^$1$" -n $FILE | awk -F: '{print $1}'`

# Exists?
[[ $from -gt 0 ]] || { echo 'No word.' ; exit 2 ; }

# The next string number.
let to=from+1

# The word. (From `Original desicion'.)
tail -n +$from $FILE | head -n 1 | grep $1 --color=auto

# The second variant.
while true ; do
    if tail -n +$to $FILE | head -n 1 | grep -E -q "\s" ; then
        let to=to+1
    else
        let quantity=to-from
        tail -n +$from $FILE | head -n $quantity
        #let from=from+1
        #let to=to-1
        #for i in `seq $from $to` ; do
        #    tail -n +$i $FILE | head -n 1 | grep --color=auto -E "\b[a-zA-Z']+\b" || \
        #      tail -n +$i $FILE | head -n 1
        #done
        exit
    fi
done

# Original desicion.
while true ; do
    tail -n +$to $FILE | head -n 1 | grep -E "\s" || exit
    let to=to+1
done

#Использование:
#  zenity [ПАРАМЕТР...]
#
#Параметры текстовой информации
#  --text-info                                          Показать диалог с текстовой информацией
#  --filename=ИМЯ_ФАЙЛА                                 Открыть файл
#  --editable                                           Разрешить изменять текст
#  --font=ТЕКСТ                                         Установить шрифт текста
#  --checkbox=ТЕКСТ                                     Включить флаговую кнопку «Я прочитал(а) и согласен(на)»
#  --html                                               Включить поддержку HTML
#  --url=URL                                            Устанавливает вместо файла URL. Работает только с параметром --html
