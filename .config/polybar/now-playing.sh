#!/usr/bin/bash

ARTIST=$(playerctl -s metadata artist)
TITLE=$(playerctl -s metadata title)
ALBUM=$(playerctl -s metadata album)
STATUS=$(playerctl -s status)

if [ "$STATUS" == "Playing" ]; then
  echo -e '\uf3aa' $ARTIST - $TITLE
elif [ "$STATUS" == "Paused" ]; then
  echo -e '\uf3a7' $ARTIST - $TITLE
else
  echo " "
fi
