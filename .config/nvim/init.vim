set nocompatible

filetype off
filetype plugin indent on
set sessionoptions-=options

" Load plugins
source ~/.config/nvim/plugs.vim

" Define leader and localleader
let mapleader=' '
let maplocalleader='\\'

" Sadly this need to be placed here
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips/"
let g:UltiSnipsSnippetDirectories=["~/.vim/UltiSnips/"]

highlight ExtraWhitespace guibg=black
