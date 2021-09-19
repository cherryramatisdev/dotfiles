function! cherry#file_management#Delete() abort
  let l:should_delete = confirm('Are you sure that want to delete?', "&Yes\n&No", 1)
  if l:should_delete == 1
    if len(expand('%')) > 0
      execute('silent ! rm -rf ' . expand('%') . '/' . getline('.'))
      execute("normal \<C-l>")
    else
      execute('silent ! rm -rf ' . getline('.'))
      execute("normal \<C-l>")
    endif
  endif
endfunction
