#!/usr/bin/env bash

if type "xrandr"; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar -q main -c "~/.config/polybar/material/config.ini" &
  done
else
  polybar --reload -q main -c "~/.config/polybar/material/config.ini" &
fi
