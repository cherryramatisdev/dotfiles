" Fix clipboard to always use the primary
set clipboard=unnamedplus

" Use two spaces for tab because i like it small
set expandtab
set tabstop=2
set softtabstop=2
set shiftwidth=2

" Handle stuff hidden, takes a little ram but nothing that vscode don't take
" more
set hidden

" I love this underline
set cursorline

" Split like a normal human
set splitright
set splitbelow

" Please no swap files, please
set noswapfile

" Enable line number and relative line number
set nu rnu

" avoid most of the 'Hit Enter ...' messages
set shortmess=aoOtTI

" This fix the file path completion to use the current buffer file as
" reference, but don't mass up with other plugins
autocmd InsertEnter * let save_cwd = getcwd() | set autochdir
autocmd InsertLeave * set noautochdir | execute 'cd' fnameescape(save_cwd)
