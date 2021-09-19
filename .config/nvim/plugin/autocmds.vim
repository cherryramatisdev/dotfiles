augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 40})
augroup END

augroup CHERRY
    autocmd!
    " Remove whitespaces on save
    autocmd BufWritePre * %s/\s\+$//e
    " Remove whitespace highlight group because it's annoying
    autocmd BufWinEnter * highlight clear ExtraWhitespace
augroup END

