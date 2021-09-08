function! cherry#file_management#Delete() abort
  let l:should_delete = confirm('Are you sure that want to delete?', "&Yes\n&No", 1)
  if l:should_delete == 1
    execute('silent ! rm -rf ' . expand('<cword>'))
    execute("normal \<C-l>")
  endif
endfunction
