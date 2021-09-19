function! cherry#colorscheme#Toggle()
  if &background == 'dark'
    set background=light
    colorscheme papercolor
  else
    set background=dark
    colorscheme codedark
  endif
endfunction
