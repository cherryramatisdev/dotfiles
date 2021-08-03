let g:mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v

" edit command
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Source current buffer
nnoremap <leader><CR> <Esc>:so %<CR>

" Open lazygit on terminal
nnoremap <leader>g <Esc>:term lazygit<CR>
