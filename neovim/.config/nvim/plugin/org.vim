" Org mode setup
augroup ORG_MODE_SETUP
  autocmd BufNewFile,BufRead *.org setf dotoo
  autocmd BufNewFile,BufRead *.org nnoremap <buffer> <CR> za
augroup END
