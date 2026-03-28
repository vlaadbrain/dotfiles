#!/bin/sh
INTERN=eDP-1
DL_LEFT=DVI-I-1-1
DL_RIGHT=DVI-I-2-2
RIGHT_OF="--right-of"
LEFT_OF="--left-of"
DIRECTION=$RIGHT_OF

# give me any parameter and i'm going to swap my screens left <-> right
switch_to_displaylink() {
  INTERN_PART="--output ${INTERN} --off"

  if [ -n "$1" ]; then
    DIRECTION=$LEFT_OF
    DL_LEFT_PART="--output ${DL_LEFT} --auto"
    DL_RIGHT_PART="--output ${DL_RIGHT} --auto --primary ${DIRECTION} ${DL_LEFT}"
  else
    DL_LEFT_PART="--output ${DL_LEFT} --auto --primary"
    DL_RIGHT_PART="--output ${DL_RIGHT} --auto ${DIRECTION} ${DL_LEFT}"
  fi

  echo "switch to $DL_RIGHT $DIRECTION $DL_LEFT"


  xrandr $INTERN_PART $DL_LEFT_PART $DL_RIGHT_PART
}

switch_to_laptop() {
  echo "switch to laptop $INTERN"
  xrandr --output "$DL_LEFT" --off --output "$DL_RIGHT" --off --output "$INTERN" --auto --primary
}

# if laptop screen is primary, switch to dock screens
if xrandr | grep "$INTERN connected primary" > /dev/null 2>&1; then
  if { xrandr | grep "$DL_LEFT connected" > /dev/null 2>&1; xrandr | grep "$DL_RIGHT connected" > /dev/null 2>&1; }; then
    switch_to_displaylink
    exit 0
  fi
else
# laptop screen is not primary
  if { xrandr | grep "$DL_LEFT connected primary" > /dev/null 2>&1; xrandr | grep "$DL_RIGHT connected" > /dev/null 2>&1; }; then
    if [ -n "$1" ]; then
      switch_to_displaylink $1
      exit 0
    else
      switch_to_laptop
      exit 0
    fi
  fi
fi
switch_to_laptop
exit 0
