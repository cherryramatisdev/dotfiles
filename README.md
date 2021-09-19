# Welcome to my dotfiles


## Usage

To use this repo you need [GNU Stow](https://www.gnu.org/software/stow/) and execute `make install` at root of project.

Makefile and stow expect you clone it into `~/projects/dotfiles`.

## Softwares configured

1. Emacs (@28 with native-comp)
2. Neovim (0.6 master branch)
3. i3wm with i3status
4. kitty
5. Zsh
6. tmux

## Setup my keyboard

1. Install kmonad via ```yay -S kmonad-bin```
2. Fix uinput with ```sudo chown -R $USER:$USER /dev/uinput```
3. Insert this service as ```/etc/systemd/system/kmonad.service```

```
[Unit]
Description=kmonad keyboard config

[Service]
Restart=always
RestartSec=3
ExecStart=/usr/bin/kmonad /home/cherry/keyboard.kbd
Nice=-20

[Install]
WantedBy=default.target
```

4. Execute service via ```sudo systemctl enable --now kmonad```

5. Voila!!!
