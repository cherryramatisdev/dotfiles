nnoremap <C-w>Q :wqall<cr>

" Indent easily
vnoremap > >gv
vnoremap < <gv

nnoremap <leader>tr :Dispatch y test %<cr>
nnoremap <leader>ta :Dispatch y test<cr>
nnoremap <leader>te :Dispatch y test:e2e<cr>

inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n>'
inoremap <C-k> <C-p>

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>

nnoremap <Up> <C-w>+
nnoremap <Down> <C-w>-
nnoremap <Right> <C-w>>
nnoremap <Left> <C-w><
