" Alternate buffer (easier than <C-^>)
nmap <leader><leader> <c-^>

" Quit vim quickly
nnoremap <leader>q ZZ

" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>


" Resize splits
nnoremap <M-h> :vertical resize -4<cr>
nnoremap <M-l> :vertical resize +4<cr>
nnoremap <M-k> :resize +4<cr>
nnoremap <M-j> :resize -4<cr>
