if system('date +%H') > 16
  set background=dark
  colorscheme codedark
else
  set background=light
  colorscheme papercolor
endif

command! ToggleColorscheme :call cherry#colorscheme#Toggle()
nnoremap <leader>ct :ToggleColorscheme<cr>
