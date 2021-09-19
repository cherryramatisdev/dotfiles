function! s:build_typescript() abort
  execute ':! node_modules/prettier/bin-prettier.js -w ' . expand('%')
endfunction

nnoremap <leader>= :call <SID>build_typescript()<cr>
