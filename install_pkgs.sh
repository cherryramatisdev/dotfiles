#!/bin/sh

echo "Installing setup"
yay -S brave
yay -S goneovim
yay -S arcolinux-logout
yay -S pavucontrol
yay -S flameshot

echo "Installing font ..."
yay -S ttf-jetbrains-mono

echo "Installing editors ..."
yay -S neovim-git
yay -S elinks # This is needed for telescope arecibo
yay -S emacs-git

echo "Installing terminal"
yay -S kitty

echo "Installing music stuff"
yay -S mpd mpv mpc ncmpcpp

echo "Installing TUI importants"
yay -S lazygit vifm
