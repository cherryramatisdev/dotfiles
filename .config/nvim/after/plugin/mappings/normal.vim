nnoremap Y y$

nnoremap <C-h> :vertical resize -4<CR>
nnoremap <C-j> :resize -4<CR>
nnoremap <C-k> :resize +4<CR>
nnoremap <C-l> :vertical resize +4<CR>

" Maintain it centered
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

" Jump list every 5 lines jumps
nnoremap <expr> j (v:count > 5 ? "m'" . v:count : "") . 'j'
nnoremap <expr> k (v:count > 5 ? "m'" . v:count : "") . 'k'
