lua require('cherry.formatter')

augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.ts,*.tsx,*.rs FormatWrite
augroup END
