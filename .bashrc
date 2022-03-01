set -o vi

# ------------------------------ local utility functions -----------------------------
_have() { type "$1" &>/dev/null; }

# ------------------------------ export env variables -----------------------------
export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin/

export PATH=$HOME/.npm-global/bin:$PATH
export PATH=$HOME/.yarn/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$GOBIN:$PATH

export JAVA_HOME="/home/linuxbrew/.linuxbrew/bin/java"
export JAVA_CMD="/home/linuxbrew/.linuxbrew/bin/java"

export SNIPPETS=$HOME/git/dotfiles/snippets
export BROWSER=firefox
export EDITOR=kak

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# ------------------------------ aliases -----------------------------

alias f=floaterm
alias '?'=duck
alias '??'=github
alias '???'=wiki
alias ls='ls --color=auto'
alias dot="cd ~/projects/dotfiles"
alias script="cd ~/bin"
alias g="git"
alias c="clear"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias tmux="tmux -2"
alias t="ta"
alias vi="vim"
alias dev="yarn start:dev"
alias y="yarn"
alias ya="yarn add"
alias kall="killall"
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

	vim_prefix=""

	if [[ $VIM ]]; then
		vim_prefix="VIM "
	fi

	user=`whoami`

	short="$r$vim_prefix$u$user$g:$w$dir$B$p$P$x "

	PS1="$short"
}

PROMPT_COMMAND="__ps1"

# --------------------------- private config ---------------------------
[[ -f "$HOME/.private-bash" ]]; . $HOME/.private-bash

# --------------------------- completion ---------------------------
_have gh && . <(gh completion -s bash)
_have git && . ~/git/dotfiles/.git-completion.bash
source /etc/bash_completion

# --------------------------- cdpath ---------------------------
export GHREPOS="/home/cherry/git"
export CDPATH=".:$GHREPOS"

source /home/cherry/.config/broot/launcher/bash/br
. "$HOME/.cargo/env"
