nnoremap <C-w>Q :wqall<cr>

" Why this is not default ?
nnoremap Y y$

" Indent easily
vnoremap > >gv
vnoremap < <gv

nnoremap <Down> :cnext<cr>
nnoremap <Up> :cprev<cr>

nnoremap <leader>tr :Dispatch y test %<cr>
nnoremap <leader>ta :Dispatch y test<cr>
nnoremap <leader>te :Dispatch y test:e2e<cr>

inoremap <expr> <C-j> pumvisible() ? '<C-n>' : '<C-x><C-o><C-n>'
inoremap <C-k> <C-p>

nnoremap <C-j> :cnext<cr>
nnoremap <C-k> :cprev<cr>
