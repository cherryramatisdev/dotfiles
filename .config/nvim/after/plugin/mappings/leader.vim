let g:mapleader=" "

nnoremap <leader>w :w<CR>
nnoremap <leader>s <C-w>s
nnoremap <leader>v <C-w>v

" edit command
map <leader>ew :e %%
map <leader>es :sp %%
map <leader>ev :vsp %%
map <leader>et :tabe %%

" Open lazygit on terminal
nnoremap <leader>g <cmd>LazyGit<CR>

" Open terminal running :term
nnoremap <leader>t <Esc>:term<CR>
