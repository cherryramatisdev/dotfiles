augroup CHERRY_TERM
    autocmd!
    autocmd TermOpen * startinsert
    autocmd TermLeave * stopinsert
augroup END

augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({ timeout = 40 })
augroup END

augroup CHERRY
    autocmd!
    autocmd BufWritePre * :call cherry#utils#TrimWhitespace()
augroup END
