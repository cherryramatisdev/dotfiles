nnoremap <leader>nt :<C-u>tabnew<cr>:pwd<cr>:VimShell<cr>
nnoremap <leader>t :<C-u>:pwd<cr>:VimShell<cr>

function s:QuitWindow() abort
  if len(expand('%')) <= 0
    execute 'q!'
  else
    execute 'q'
  endif
endfunction

nnoremap <leader>q <cmd>call <SID>QuitWindow()<cr>
nnoremap <leader>w <cmd>w<cr>
