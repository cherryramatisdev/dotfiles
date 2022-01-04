# ------------------------------ export env variables -----------------------------
export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export BROWSER=firefox
export EDITOR=vim

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ------------------------------ aliases -----------------------------

alias '?'=duck
alias '??'=github
alias '???'=wiki
alias ls="exa"
alias la="exa -lha"
alias dot="cd ~/projects/dotfiles"
alias script="cd ~/bin"
alias g="git"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tmux="tmux -2"
alias t="ta"
alias v="vim"
alias vi="vim"
alias dev="yarn start:dev"
alias y="yarn"
alias ya="yarn add"
alias kall="killall"
alias padd="sudo pacman -S"
alias premove="sudo pacman -R"
alias pgrep="sudo pacman -Qe | grep"
alias plist="sudo pacman -Qe"
alias pupdate="sudo pacman -Syuu"
alias depupdate="yarn upgrade-interactive --latest"
alias postgresup="docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -e TZ=America/Sao_Paulo -d postgres"
alias asdf="setxkbmap -layout us -variant dvorak"
alias aoeu="setxkbmap -layout us"

# ------------------------ bash shell options ------------------------

shopt -s checkwinsize
shopt -s expand_aliases
shopt -s globstar
shopt -s dotglob
shopt -s extglob
#shopt -s nullglob # bug kills completion for some
#set -o noclobber

# ------------------------------ history -----------------------------

export HISTCONTROL=ignoreboth
export HISTSIZE=5000
export HISTFILESIZE=10000

set -o vi
shopt -s histappend

# --------------------------- smart prompt ---------------------------
#                 (keeping in bashrc for portability)

# reference: https://github.com/rwxrob/dot/blob/main/.bashrc
PROMPT_LONG=20
PROMPT_MAX=95
PROMPT_AT=@

__ps1() {
  local P='$' dir="${PWD##*/}" B countme short long double\
    r='\[\e[31m\]' g='\[\e[30m\]' h='\[\e[34m\]' \
    u='\[\e[33m\]' p='\[\e[34m\]' w='\[\e[35m\]' \
    b='\[\e[36m\]' x='\[\e[0m\]'

  [[ $EUID == 0 ]] && P='#' && u=$r && p=$u # root
  [[ $PWD = / ]] && dir=/
  [[ $PWD = "$HOME" ]] && dir='~'

  B=$(git branch --show-current 2>/dev/null)
  [[ $dir = "$B" ]] && B=.

  [[ $B = master || $B = main ]] && b="$r"
  [[ -n "$B" ]] && B="$g($b$B$g)"

	vim_prefix="VIM "

	if [[ ! $VIM ]]; then
		vim_prefix=""
	fi

	short="$r$vim_prefix$u\h$g:$w$dir$B$p$P$x "

	PS1="$short"
}

PROMPT_COMMAND="__ps1"

# --------------------------- keybinding ---------------------------

set -o vi
bind -m vi-insert "\C-j":accept-line
bind -m vi-insert "\C-h":backward-delete-char
bind -m vi-insert "\C-a":beginning-of-line
bind -m vi-insert "\C-e":end-of-line
bind -m vi-insert "\C-k":kill-line
bind -m vi-insert "\C-b":backward-char
bind -m vi-insert "\C-f":forward-char
bind -m vi-insert "\C-d":delete-char
bind -m vi-insert "\C-w":backward-kill-word
bind -m vi-insert "\C-l":clear-display
bind -m vi-insert "\C-p":previous-history
bind -m vi-insert "\C-n":next-history
