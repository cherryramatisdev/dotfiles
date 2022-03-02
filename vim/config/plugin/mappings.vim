nnoremap <leader>nt :<C-u>tabnew<cr>:pwd<cr>:VimShellCreate<cr>
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

nnoremap L gt
nnoremap H gT
