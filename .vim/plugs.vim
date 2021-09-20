if &compatible
  set nocompatible
endif

function! PackInit() abort
  packadd minpac

  call minpac#init()

  call minpac#add('ervandew/supertab')

  call minpac#add('inkarkat/vim-ReplaceWithRegister')
  call minpac#add('christoomey/vim-titlecase')
  call minpac#add('christoomey/vim-system-copy')
  call minpac#add('christoomey/vim-conflicted')

  call minpac#add('tomasiser/vim-code-dark')

  " Text objects
  call minpac#add('kana/vim-textobj-user')
  call minpac#add('kana/vim-textobj-line')
  call minpac#add('kana/vim-textobj-function')
  call minpac#add('kana/vim-textobj-entire')

  " tpope fandom
  call minpac#add('tpope/vim-sensible')
  call minpac#add('tpope/vim-sleuth')
  call minpac#add('tpope/vim-repeat')
  call minpac#add('tpope/vim-unimpaired')
  call minpac#add('tpope/vim-surround')
  call minpac#add('tpope/vim-vinegar')
  call minpac#add('tpope/vim-obsession')
  call minpac#add('tpope/vim-fugitive')
  call minpac#add('tpope/vim-commentary')
  call minpac#add('tpope/vim-rsi')
  call minpac#add('tpope/vim-scriptease')
  call minpac#add('tpope/vim-eunuch')
  call minpac#add('tpope/vim-characterize')

  call minpac#add('AndrewRadev/tagalong.vim')
  call minpac#add('AndrewRadev/ginitpull.vim')

  call minpac#add('dhruvasagar/vim-open-url')

  call minpac#add('yuratomo/w3m.vim')
  call minpac#add('airblade/vim-rooter')
  call minpac#add('thinca/vim-fontzoom')
endfunction

command! PackUpdate call PackInit() | call minpac#update()
command! PackClean  call PackInit() | call minpac#clean()
command! PackStatus packadd minpac | call minpac#status()

set runtimepath+=~/projects/plugins/semantical-commits.vim/
set runtimepath+=~/projects/plugins/translator.vim/
