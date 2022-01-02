alias ls="exa"
alias la="exa -lha"
alias g="git"
alias gs="git s"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tmux="tmux -2"
alias t="tmux new-session -A -s main"
alias e="emacsclient -t"
alias v="vim"
alias n="nvim"
alias dev="yarn start:dev"
alias ytdownload="youtube-dl -f 249"
alias y="yarn"
alias ya="yarn add"
alias kall="killall"
alias padd="sudo pacman -S"
alias premove="sudo pacman -R"
alias pgrep="sudo pacman -Qe | grep"
alias plist="sudo pacman -Qe"
alias pupdate="sudo pacman -Syuu"
alias anime="ani-cli"
alias depupdate="yarn upgrade-interactive --latest"
alias postgresup="docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e TZ=America/Sao_Paulo -d postgres"
alias asdf="setxkbmap -layout us -variant dvorak"
alias aoeu="setxkbmap -layout us"

fish_add_path "$HOME/.npm-global/bin"
fish_add_path "$HOME/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/bin"

set --universal nvm_default_version lts

fish_add_path /var/lib/snapd/snap/bin

set -gx BROWSER brave
set -gx EDITOR nvim

set -gx _ZL_CD cd

set -gx fish_greeting ""
set -gx BROWSER brave
