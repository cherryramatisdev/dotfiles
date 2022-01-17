syntax on
filetype plugin indent on

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.local/share/vim/plugins')
Plug 'morhetz/gruvbox'

Plug 'vim-pandoc/vim-pandoc'
Plug 'rwxrob/vim-pandoc-syntax-simple'

" Plug 'sheerun/vim-polyglot'
Plug 'prettier/vim-prettier', {
      \ 'do': 'yarn install --frozen-lockfile --production',
      \ 'for': ['javascript', 'typescript', 'typescriptreact', 'javascriptreact'] }
Plug 'wincent/ferret'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'justinmk/vim-dirvish'

Plug 'fatih/vim-go', { 'do': ':GoInstallBinaries' }
" Plug 'Quramy/tsuquyomi'
call plug#end()

" high contrast for streaming, etc.
set background=dark
colorscheme gruvbox

" Section: General sets
set clipboard=unnamedplus
set tabstop=2 softtabstop=2 shiftwidth=2

" disable statusline to be more minimal and rely on tmux
set laststatus=0
set statusline=

" manage completion popups properly
set completeopt-=preview
set completeopt+=longest,menuone,noselect

" faster scrolling
set ttyfast

" numbers
set number

" use proper menu
set wildmenu

" When I split, go to that split window
set splitright splitbelow

" Ignore stuff for fuzzy finding be faster
set wildignore+=**/node_modules/**
set wildignore+=**/dist/**
set wildignore+=**/bundle/**
set wildignore+=**/deps/**

set path+=** " Enable the fuzzy finder

" Manage multiple buffers without saving it, it takes RAM but it's not a
" vscode
set hidden

" Please don't make me delete those .swp files anymore
set noswapfile
set nobackup

" Section: Displaying text

if exists('+breakindent')
  set breakindent showbreak=\ +
endif

setglobal display=lastline
setglobal scrolloff=1
setglobal sidescrolloff=5
setglobal lazyredraw
set cmdheight=2

" automatically indent new lines
set autoindent

" automatically write files when changing when multiple files open
set autowrite

" turn col and row position on in bottom right
set ruler " see ruf for formatting

" show command and insert mode
set showmode

" stop vim from silently messing with files that it shouldn't
set nofixendofline

" better ascii friendly listchars
set listchars=space:*,trail:*,nbsp:*,extends:>,precedes:<,tab:\|>

" i hate automatic folding
set foldmethod=manual
set nofoldenable

" Section: manage custom highlights
highlight MyTodo ctermbg=236 ctermfg=darkred
highlight MyDone ctermbg=236 ctermfg=darkgreen
call matchadd("MyTodo", "TODO")
call matchadd("MyDone", "DONE")

" Section: quit quickfix list equal to fugitive
au FileType qf nmap <buffer> gq <cmd>q<cr>

" Section: pandoc settings
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
let g:pandoc#formatting#mode = 'h' " A'
let g:pandoc#formatting#textwidth = 72

function! SwitchTodos() abort
        let l:line = getline('.')
        let l:find_todo = matchstr(l:line, "TODO")
        let l:find_done = matchstr(l:line, "DONE")

        if len(l:find_todo) > 0
                :s/TODO/DONE
        endif

        if len(l:find_done) > 0
                :s/DONE/TODO
        endif
endfunction

au FileType markdown,pandoc nmap <buffer> <CR> <cmd>call SwitchTodos()<cr>

" Section: autodetect filetypes
" bork bash detection
if has("eval")  " vim-tiny detection
  fun! s:DetectBash()
    if getline(1) == '#!/usr/bin/bash' || getline(1) == '#!/bin/bash'
      set ft=bash
      set shiftwidth=2
    endif
  endfun
  autocmd BufNewFile,BufRead * call s:DetectBash()
endif

" Section: golang config
let g:go_fmt_fail_silently = 0
let g:go_fmt_command = 'goimports'
let g:go_fmt_autosave = 1
let g:go_gopls_enabled = 1
let g:go_highlight_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_variable_declarations = 1
let g:go_highlight_variable_assignments = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_diagnostic_errors = 1
let g:go_highlight_diagnostic_warnings = 1
"let g:go_auto_type_info = 1 " forces 'Press ENTER' too much
let g:go_auto_sameids = 0
"let g:go_metalinter_command='golangci-lint'
"let g:go_metalinter_command='golint'
"let g:go_metalinter_autosave=1
set updatetime=100
"let g:go_gopls_analyses = { 'composites' : v:false }
au FileType go nmap <leader>t :GoTest!<CR>
au FileType go nmap <leader>v :GoVet!<CR>
au FileType go nmap <leader>b :GoBuild!<CR>
au FileType go nmap <leader>c :GoCoverageToggle<CR>
au FileType go nmap <leader>i :GoInfo<CR>
au FileType go nmap <leader>l :GoMetaLinter!<CR>
