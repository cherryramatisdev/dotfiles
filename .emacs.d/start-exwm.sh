#!/bin/sh

exec dbus-launch --exit-with-session emacs -mm --debug-init

sxhkd &
nm-applet &
xrandr --auto --output HDMI-1 --mode 2560x1080 --left-of DVI-D-1 &
dunst &
mpd &
flameshot &
feh --bg-fill ~/wallpapers/dusk-in-pixels.jpg &
