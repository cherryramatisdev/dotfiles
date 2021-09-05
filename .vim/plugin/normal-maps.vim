" Alternate buffer (easier than <C-^>)
nmap <leader><leader> <c-^>

" Quit vim quickly
nnoremap <leader>q ZZ

" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" splits
nnoremap <leader>w <C-w>v<C-w>l

" Open window below instead of above"
nnoremap <c-w>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Vertical equivalent of c-w-n and c-w-N"
nnoremap <c-w>v :vnew<CR>
nnoremap <c-w>V :let spr=&spr<BAR>set nospr<BAR>vnew<BAR>let &spr=spr<CR>

" Resize splits
nnoremap <M-h> :vertical resize -4<cr>
nnoremap <M-l> :vertical resize +4<cr>
nnoremap <M-k> :resize +4<cr>
nnoremap <M-j> :resize -4<cr>
