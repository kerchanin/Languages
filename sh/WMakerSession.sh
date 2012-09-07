sudo /etc/init.d/exim4 stop
sudo /etc/init.d/acpid stop
sudo /etc/init.d/atd stop
sudo /etc/init.d/portmap stop
sudo /etc/init.d/rsyslog stop
sudo /etc/init.d/udev stop

sudo Xorg :0 &
export DISPLAY=:0
uxterm -fa Monospace -fs 10 &
uxterm -fa Monospace -fs 10 -e mc &
wmaker &
wmdate &
mwtime &

