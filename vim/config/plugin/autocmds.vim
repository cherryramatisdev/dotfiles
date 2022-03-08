" function s:OpenShell() abort
" 	execute 'VimShell'
" endfunction

" augroup cherry_shell
" 	autocmd!
" 	" Only start vimshell if vim is started without file arguments.
" 	autocmd StdinReadPre * let s:std_in=1
" 	autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | call <SID>OpenShell() | endif
" augroup END
