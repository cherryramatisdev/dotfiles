if system('date +%H') > 16
  set background=dark
  colorscheme paramount
else
  set background=light
  colorscheme papercolor
endif

command! ToggleColorscheme :call cherry#colorscheme#Toggle()
nnoremap <leader>ct :ToggleColorscheme<cr>
