let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

let mapleader = " "

filetype plugin indent on
syntax enable
if &compatible
  set nocompatible               " Be iMproved
endif

call plug#begin()

Plug 'drmikehenry/vim-fontsize'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'thinca/vim-quickrun'

Plug 'scrooloose/nerdtree'
Plug 'AndrewRadev/andrews_nerdtree.vim'

" section for andrew
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/inline_edit.vim'
Plug 'AndrewRadev/switch.vim'
Plug 'AndrewRadev/tagalong.vim', { 'for': ['eruby'] }

" section for tpope
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-projectionist'
Plug 'tpope/vim-haystack'

Plug 'tyru/open-browser.vim'

" Plug 'ludovicchabant/vim-gutentags'

Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install --frozen-lockfile --production',
  \ 'for': ['javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'css', 'json', 'markdown', 'html'] }

Plug 'dhruvasagar/vim-dotoo'
Plug 'dhruvasagar/vim-zoom'

Plug 'sirver/UltiSnips'
" Plug 'honza/vim-snippets'

Plug 'christoomey/vim-tmux-navigator'

Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

Plug 'rhysd/committia.vim'

" This is the IDE part for javascript
Plug 'artemave/vjs', { 'do': 'npm install' }

Plug 'jiangmiao/auto-pairs'

Plug 'vim-test/vim-test'

call plug#end()
