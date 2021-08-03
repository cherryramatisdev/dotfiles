set termguicolors
set number
set relativenumber

set completeopt=menuone,noselect

set guicursor= " Blocky cursor
set noshowmode
set showcmd
set cmdheight=1 " Height of the command bar
set incsearch " Makes search act like search in modern browsers
set showmatch " show matching brackets when text indicator is over them
set ignorecase " Ignore case when searching...
set smartcase " ... unless there is a capital letter in the query
set hidden " I like having buffers stay around
set cursorline " Highlight the current line
set noequalalways " I don't like my windows changing all the time
set splitright " Prefer windows splitting to the right
set splitbelow " Prefer windows splitting to the bottom
set updatetime=1000 " Make updates happen faster
set hlsearch " I wouldn't use this without my DoNoHL function
set nohlsearch
set scrolloff=3 " Make it so there are always ten lines below my cursor

" Tabs
set autoindent
set cindent
set wrap
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set breakindent
set linebreak
set foldmethod=marker
set foldlevel=0
set modelines=1
set belloff=all
set clipboard=unnamedplus
set inccommand=split
set noswapfile

" Disable statusline
set laststatus=0

" Transparency backgroundo
" hi Normal guibg=NONE ctermbg=NONE
