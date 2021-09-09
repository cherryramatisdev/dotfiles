augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

" Remove whitespaces on save
augroup CHERRY
    autocmd!
    autocmd BufWritePre * %s/\s\+$//e
augroup END
