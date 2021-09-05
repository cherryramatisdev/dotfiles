set tabstop=2 softtabstop=2 shiftwidth=2 shiftround expandtab nowrap
set noswapfile hlsearch cursorline noshowmode
set ignorecase smartcase
set textwidth=80 colorcolumn=+1
set nu rnu
set hidden
set guicursor=

set laststatus=2 " Always display the statusline in all windows
set showtabline=2

set statusline=
set statusline+=%<%f\ %h%m%r             " filename and flags
set statusline+=%{fugitive#statusline()} " git info
set statusline+=%=                       " alignment separator
set statusline+=[%{&ft}]                 " filetype

set switchbuf=useopen
set showfulltag
set incsearch

set termencoding=utf-8 encoding=utf-8
set novisualbell noerrorbells
set splitbelow splitright
set tags^=./.git/tags;

set clipboard=unnamed

" Prevent vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=

" keep more context when scrolling off the end of a buffer
set scrolloff=1

" Disable all backup files
set noundofile
set noswapfile
set nobackup

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" display incomplete commands
set showcmd

" make tab completion for files/buffers act like bash
set wildmenu
set wildmode=full "list:full
set wildignore=*.swp,*.bak,*.pyc,*.class,*/.git/*,*/tmp/*

" Insert only one space when joining lines that contain sentence-terminating
" ponctuation like `.`.
set nojoinspaces

" If a file is changed outside of vim, automatically reload it without asking
set autoread
set autoindent copyindent smartindent

" copied from spf13
set mouse=a mousehide
scriptencoding utf-8
set viewoptions=folds,options,cursor,unix,slash
set history=1000
set iskeyword-=.                    " '.' is an end of word designator
set iskeyword-=#                    " '#' is an end of word designator
set iskeyword-=-                    " '-' is an end of word designator
