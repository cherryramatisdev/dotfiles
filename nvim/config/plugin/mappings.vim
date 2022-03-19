function s:QuitWindow() abort
	if len(expand('%')) <= 0
		execute 'bd!'
	else
		execute 'bd'
	endif
endfunction

nnoremap <leader>q <cmd>call <SID>QuitWindow()<cr>
nnoremap <leader>w <cmd>w<cr>
