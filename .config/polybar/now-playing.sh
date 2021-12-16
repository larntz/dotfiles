#!/usr/bin/bash

ARTIST=$(playerctl -s metadata artist)
TITLE=$(playerctl -s metadata title)
ALBUM=$(playerctl -s metadata album)
STATUS=$(playerctl -s status)

if [ "$STATUS" == "Playing" ]; then
  echo -e '\ue037' $ARTIST - $TITLE
elif [ "$STATUS" == "Paused" ]; then
  echo -e '\ue034' $ARTIST - $TITLE
else
  echo " "
fi
