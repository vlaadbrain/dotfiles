#!/bin/sh
# dwm startup-script:
#
# Apply my fonts
# xset +fp ~/.terminus &
# xset fp rehash
# source my Xresources
xrdb -load ~/.Xdefaults
setxkbmap -option ctrl:swapcaps

export PATH=$HOME/bin:$PATH
exec ${HOME}/bin/startdwm &
DWMPID=$!

xsetroot -solid darkslategray &
xset s 3300
xset +dpms
xset dpms 3600 3900 4200
# Turn off beeps:
xset -b &

/usr/local/bin/sdwmbar &
SDWMBARPID=$!

${HOME}/bin/wmname LG3D &
eval `ssh-agent`

wait $DWMPID

setxkbmal -option
ssh-agent -k
kill $SDWMBARPID
