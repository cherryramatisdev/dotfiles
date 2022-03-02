if has('gui')
	set guicursor=n-v-c-i:block-Cursor/lCursor
	set guioptions-=T
	set guioptions-=m
	set guioptions-=s
	set guioptions-=r
	set guioptions-=l
	set guioptions-=b

	nnoremap <C-Up> :silent! let &guifont = substitute(
				\ &guifont,
				\ ':h\zs\d\+',
				\ '\=eval(submatch(0)+1)',
				\ '')<CR>
	nnoremap <C-Down> :silent! let &guifont = substitute(
				\ &guifont,
				\ ':h\zs\d\+',
				\ '\=eval(submatch(0)-1)',
				\ '')<CR>
endif
