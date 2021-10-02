alias ls="exa"
alias la="exa -lha"
alias g="git"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tmux="tmux -2"
alias t="tmux new-session -A -s main"
alias v="vim"
alias n="nvim"
alias dev="yarn start:dev"
alias y="yarn"
alias ya="yarn add"
alias kall="killall"
alias padd="sudo pacman -S"
alias psearch="sudo pacman -Qe | grep"
alias plist="sudo pacman -Qe"
alias pupdate="sudo pacman -Syuu"

fish_add_path "$HOME/.npm-global/bin"

set -gx EDITOR "nvim"
set -gx PAGER "nvim"
set -gx VISUAL "nvim"
set -gx MANPAGER "nvim +Man! -c ':set signcolumn='"
alias vimdiff="nvim -d"

set -gx _ZL_CD cd

set -gx fish_greeting ""
set -gx BROWSER "qutebrowser"

bind -M insert \ce 'accept-autosuggestion'
bind -M insert \cx\cf 'find-files'
bind -M insert \cx\ct 'tmux new-session -A -s main'
bind -M insert \cx\cp 'tmux-sessionizer'
bind -M insert \cx\ce 'ranger'
