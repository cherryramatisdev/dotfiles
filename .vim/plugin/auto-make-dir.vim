augroup auto_make_dir
  autocmd!
  autocmd BufWritePre,FileWritePre * :call cherry#directory#AutoMakeDirectory()
augroup END
