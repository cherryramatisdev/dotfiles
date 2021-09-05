set background=dark
colorscheme cherry

command! ToggleColorscheme :call cherry#colorscheme#Toggle()
nnoremap <leader>ct :ToggleColorscheme<cr>
