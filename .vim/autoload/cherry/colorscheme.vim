function! cherry#colorscheme#Toggle()
  if &background == 'dark'
    set background=light
    colorscheme papercolor
  else
    set background=dark
    colorscheme paramount
    " colorscheme cherry
  endif
endfunction
