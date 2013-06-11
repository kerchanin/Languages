#!/bin/bash
#http://zenux.ru/articles/47/

# Код города:
CITY=34009_1
DATA=$(wget http://informer.gismeteo.ru/xml/$CITY.xml -q -O - | tr '\n' ' ')
PRESSUREMAX=`echo $DATA | awk '{print $26}' | tr -d \" | tr -d 'max='`
TEMPMAX=`echo $DATA | awk '{print $29}' | tr -d 'max=',\"`
TEMPMIN=`echo $DATA | awk '{print $30}' | tr -d 'min=',\","/>"`

if [[ -n $DATA ]] ; then
    echo "$TEMPMAX..$TEMPMIN°C ${PRESSUREMAX}mm"
else
    echo "Проверьте подключение..."
fi
