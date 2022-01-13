#!/usr/bin/bash

CURRENT_VOLUME=$(pactl get-sink-volume @DEFAULT_SINK@ | awk '/^\Volume:/ {gsub("%","");print $5}')

if [ $CURRENT_VOLUME -ge 90 ]
then 
  pactl set-sink-volume @DEFAULT_SINK@ 100% 
else
  pactl set-sink-volume @DEFAULT_SINK@ +5% 
fi
