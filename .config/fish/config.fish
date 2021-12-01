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
alias postgresup="docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres"

fish_add_path "$HOME/.npm-global/bin"
fish_add_path "$HOME/bin"
fish_add_path "$HOME/go/bin"
fish_add_path "$HOME/.cargo/bin"
fish_add_path "$HOME/.local/bin"

fish_add_path /var/lib/snapd/snap/bin

set gem_home (ruby -e 'puts Gem.user_dir')

set -gx GEM_HOME $gem_home
fish_add_path "$GEM_HOME/bin"

set -gx BROWSER brave
set -gx EDITOR vim

set -gx _ZL_CD cd

set -gx fish_greeting ""
set -gx BROWSER brave
set -q GHCUP_INSTALL_BASE_PREFIX[1]; or set GHCUP_INSTALL_BASE_PREFIX $HOME
set -gx PATH $HOME/.cabal/bin /home/cherry/.ghcup/bin $PATH # ghcup-env
