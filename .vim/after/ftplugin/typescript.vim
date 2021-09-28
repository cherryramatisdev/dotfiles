function! s:build_typescript() abort
  execute ':! node_modules/prettier/bin-prettier.js -w ' . expand('%')
endfunction

nnoremap <buffer> <leader>= :call <SID>build_typescript()<cr>

setlocal path=.,,src/**

nnoremap <buffer> <leader>ca :ALECodeAction<cr>
nnoremap <buffer> <leader>co :ALEOrganizeImports<cr>
nnoremap <buffer> K :ALEHover<cr>
nnoremap <buffer> gd :ALEGoToDefinition<cr>
