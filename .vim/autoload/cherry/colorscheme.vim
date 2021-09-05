function! cherry#colorscheme#Toggle()
  if g:colors_name == 'cherry'
    set background=light
    colorscheme papercolor
  else
    set background=dark
    colorscheme cherry
  endif
endfunction
