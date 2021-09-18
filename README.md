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

1. insert this file inside /etc/interception/udevmon.yaml

```
- JOB: "/home/cherry/Downloads/gitthings/interception-tools/build/intercept -g $DEVNODE | dual-function-keys -c /etc/interception/dual-function-keys/keyboard.yaml | /home/cherry/Downloads/gitthings/interception-tools/build/uinput -d $DEVNODE"
  DEVICE:
    NAME: "SONiX USB DEVICE"
    EVENTS:
      EV_KEY: [KEY_CAPSLOCK, KEY_ENTER, KEY_LEFTSHIFT, KEY_RIGHTSHIFT, KEY_LEFTCTRL, KEY_RIGHTCTRL, KEY_ESC, KEY_TAB, KEY_LEFTMETA]
```

2. insert this files inside /etc/interception/dual-function-keys/keyboard.yaml

```
TIMING:
  TAP_MILLISEC: 200
  DOUBLE_TAP_MILLISEC: 150

MAPPINGS:
  - KEY: KEY_CAPSLOCK
    TAP: KEY_ESC
    HOLD: KEY_LEFTCTRL

  - KEY: KEY_TAB
    TAP: KEY_TAB
    HOLD: KEY_LEFTALT

  - KEY: KEY_ENTER
    TAP: KEY_ENTER
    HOLD: KEY_LEFTMETA
```

3. add this file inside /etc/systemd/system/udevmon.service

```
[Unit]
Description=udevmon

[Service]
ExecStart=/usr/bin/nice -n -20 /home/cherry/Downloads/gitthings/interception-tools/build/udevmon -c /etc/interception/udevmon.yaml

[Install]
WantedBy=multi-user.target
```
