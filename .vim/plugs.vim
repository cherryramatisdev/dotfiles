filetype plugin indent on
syntax enable

if &compatible
  set nocompatible               " Be iMproved
endif

set runtimepath+=/home/cherry/.cache/dein/repos/github.com/Shougo/dein.vim

" set runtimepath+=~/projects/plugins/semantical-commits.vim/
" set runtimepath+=~/projects/plugins/translator.vim/
" set runtimepath+=~/projects/plugins/projectile.vim/

call dein#begin('/home/cherry/.cache/dein')

call dein#add('/home/cherry/.cache/dein/repos/github.com/Shougo/dein.vim')

call dein#add('cherryramatisdev/semantical-commits.vim')

call dein#add('inkarkat/vim-ReplaceWithRegister')
call dein#add('christoomey/vim-titlecase')
call dein#add('christoomey/vim-system-copy')
call dein#add('christoomey/vim-conflicted')

call dein#add('srcery-colors/srcery-vim')

" Text objects
call dein#add('kana/vim-textobj-user')
call dein#add('kana/vim-textobj-line')
call dein#add('kana/vim-textobj-function')
call dein#add('kana/vim-textobj-entire')

" tpope fandom
call dein#add('tpope/vim-sensible')
call dein#add('tpope/vim-sleuth')
call dein#add('tpope/vim-repeat')
call dein#add('tpope/vim-unimpaired')
call dein#add('tpope/vim-surround')
call dein#add('tpope/vim-vinegar')
call dein#add('tpope/vim-obsession')
call dein#add('tpope/vim-fugitive')
call dein#add('tpope/vim-commentary')
call dein#add('tpope/vim-rsi')
call dein#add('tpope/vim-scriptease')
call dein#add('tpope/vim-eunuch')
call dein#add('tpope/vim-characterize')
call dein#add('tpope/vim-markdown')
call dein#add('tpope/vim-endwise')

call dein#add('reedes/vim-pencil')

call dein#add('AndrewRadev/tagalong.vim')
call dein#add('AndrewRadev/ginitpull.vim')

call dein#add('dhruvasagar/vim-open-url')
call dein#add('dhruvasagar/vim-zoom')

call dein#add('yuratomo/w3m.vim')

call dein#add('Shougo/vimshell.vim')
call dein#add('Shougo/vimproc.vim', {'build' : 'make'})

call dein#add('airblade/vim-rooter')

call dein#add('fatih/vim-go')
call dein#add('mattn/emmet-vim')

call dein#add('vuciv/vim-bujo')

call dein#add('dense-analysis/ale')

call dein#add('SirVer/ultisnips')
call dein#add('honza/vim-snippets')

call dein#end()

filetype plugin indent on
syntax enable

if dein#check_install()
  call dein#install()
endif
