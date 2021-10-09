#!/bin/bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}
run dex $HOME/.config/autostart/arcolinux-welcome-app.desktop

exec --no-startup-id xrandr --auto --output HDMI-1 --mode 2560x1080 --left-of DVI-D-1

run nm-applet

run pamac-tray
run variety
run xfce4-power-manager
run blueberry-tray
run volumeicon

feh --bg-fill ~/Pictures/background.jpg &
