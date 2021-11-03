filetype plugin on
syntax on

set path+=**
set number
set relativenumber
set cursorline
set hidden
set nohlsearch
set ignorecase
set smartcase
set textwidth=80
set laststatus=2
set showtabline=1
set switchbuf=useopen
set showfulltag
set incsearch
set novisualbell
set noerrorbells

set splitbelow
set splitright

set clipboard=unnamed

set noundofile
set noswapfile
set nobackup

nnoremap sv <C-w>v
nnoremap ss <C-w>s

nnoremap sh <C-w>h
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l

nnoremap ;x :so %<cr>
nnoremap ;w :w<cr>
nnoremap ;q ZZ
