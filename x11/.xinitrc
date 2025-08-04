#!/bin/sh
# dwm startup-script:
#
# Apply my fonts
# xset +fp ~/.terminus &
# xset fp rehash
# source my Xresources
xrdb -load ~/.Xdefaults
setxkbmap -option ctrl:swapcaps

PATH=${PATH}:/home/cjt/bin

exec ${HOME}/bin/startdwm &
DWMPID=$!

xsetroot -solid darkslategray &
xset s 3300
xset +dpms
xset dpms 3600 3900 4200
# Turn off beeps:
xset -b &

exec ${HOME}/bin/xsidle.sh slock &
XSIDLEPID=$!

/usr/sbin/alsactl -f ${HOME}/.alsa.state restore
nice mpd &

exec ${HOME}/bin/dwmstatus &
DWMSTATUSPID=$!

# ${HOME}/bin/wmname LG3D &
eval `ssh-agent`

##### WAIT FOR DWM!! #####
wait $DWMPID
#####    Exiting!    #####

setxkbmap -option
ssh-agent -k
/usr/sbin/alsactl -f ${HOME}/.alsa.state store

kill $DWMSTATUSPID
kill $XSIDLEPID
