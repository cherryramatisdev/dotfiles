#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# userresources=$HOME/.Xresources
# usermodmap=$HOME/.Xmodmap
# sysresources=/etc/X11/xinit/.Xresources
# sysmodmap=/etc/X11/xinit/.Xmodmap
#
# SESSION=${1:-xfce-session}
#
# # merge in defaults and keymaps
#
# if [ -f $sysresources ]; then
#     xrdb -merge $sysresources
# fi
#
# if [ -f $sysmodmap ]; then
#     xmodmap $sysmodmap
# fi
#
# if [ -f "$userresources" ]; then
#     xrdb -merge "$userresources"
# fi
#
# if [ -f "$usermodmap" ]; then
#     xmodmap "$usermodmap"
# fi
#
# # start some nice programs
#
# if [ -d /etc/X11/xinit/xinitrc.d ] ; then
#     for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
#         [ -x "$f" ] && . "$f"
#     done
#     unset f
# fi

# autostart stuff
function run {
    if ! pgrep $1 ;
    then
	$@&
    fi
}

$HOME/.config/polybar/launch.sh --material

run mpd &
run dunst &
# run dwmblocks &
# run compton &
# run emacs --daemon &

run nm-applet
run volumeicon

run feh --bg-fill ~/wallpapers/dusk-in-pixels.jpg &

run xrandr --output HDMI-1 --primary --mode 2560x1080 --left-of DVI-D-1 --mode 2560x1080

run sxhkd &

# exec dwm
exec bspwm
