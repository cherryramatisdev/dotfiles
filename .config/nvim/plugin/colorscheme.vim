" if system('date +%H') > 16
"   set background=dark
"   colorscheme codedark
" else
"   set background=light
"   colorscheme papercolor
" endif

set background=dark
colorscheme codedark

command! ToggleColorscheme :call cherry#colorscheme#Toggle()
nnoremap <leader>ct :ToggleColorscheme<cr>
