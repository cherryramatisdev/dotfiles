#!/bin/sh

echo "Installing font ..."
yay -S ttf-jetbrains-mono

echo "Installing editors ..."
yay -S neovim-git
yay -S emacs-git

echo "Installing terminal"
yay -S kitty

echo "Installing music stuff"
yay -S mpd mpv mpc ncmpcpp

echo "Installing TUI importants"
yay -S lazygit vifm
