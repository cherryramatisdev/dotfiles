let g:colors_name = 'cherrydark'

" Just the defaults, these are changed per filetype by plugins.
" Most of the utility of all of this has been superceded by the use of
" modern simplified pandoc for capturing knowledge source instead of
" arbitrary raw text files.
set fo-=t   " don't auto-wrap text using text width
set fo+=c   " autowrap comments using textwidth with leader
set fo-=r   " don't auto-insert comment leader on enter in insert
set fo-=o   " don't auto-insert comment leader on o/O in normal
set fo+=q   " allow formatting of comments with gq
set fo-=w   " don't use trailing whitespace for paragraphs
set fo-=a   " disable auto-formatting of paragraph changes
set fo-=n   " don't recognized numbered lists
set fo+=j   " delete comment prefix when joining
set fo-=2   " don't use the indent of second paragraph line
set fo-=v   " don't use broken 'vi-compatible auto-wrapping'
set fo-=b   " don't use broken 'vi-compatible auto-wrapping'
set fo+=l   " long lines not broken in insert mode
set fo+=m   " multi-byte character line break support
set fo+=M   " don't add space before or after multi-byte char
set fo-=B   " don't add space between two multi-byte chars
set fo+=1   " don't break a line after a one-letter word

set background=dark

" base default color changes (gruvbox dark friendly)
hi StatusLine ctermbg=black ctermfg=black
hi StatusLineNC ctermbg=black ctermfg=black
hi VertSplit ctermbg=black ctermfg=black
hi Normal ctermbg=NONE
hi Special ctermfg=cyan
hi LineNr ctermfg=black ctermbg=NONE
hi SpecialKey ctermfg=black ctermbg=NONE
hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
hi MoreMsg ctermfg=black ctermbg=NONE
hi NonText ctermfg=black ctermbg=NONE
hi vimGlobal ctermfg=black ctermbg=NONE
hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
hi Error ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
hi Search ctermbg=236 ctermfg=darkred
hi vimTodo ctermbg=236 ctermfg=darkred
hi Todo ctermbg=236 ctermfg=darkred
hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
hi MatchParen ctermbg=236 ctermfg=darkred

" color overrides
au FileType * hi StatusLine ctermfg=black ctermbg=black
au FileType * hi StatusLineNC ctermfg=black ctermbg=black
au FileType * hi VertSplit ctermbg=black ctermfg=black
au FileType * hi Normal ctermbg=NONE
au FileType * hi Special ctermfg=cyan
au FileType * hi LineNr ctermfg=darkgray ctermbg=NONE
au FileType * hi SpecialKey ctermfg=black ctermbg=NONE
au FileType * hi ModeMsg ctermfg=black cterm=NONE ctermbg=NONE
au FileType * hi MoreMsg ctermfg=black ctermbg=NONE
au FileType * hi NonText ctermfg=black ctermbg=NONE
au FileType * hi vimGlobal ctermfg=black ctermbg=NONE
au FileType * hi goComment ctermfg=gray ctermbg=NONE
au FileType * hi ErrorMsg ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Error ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellBad ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi SpellRare ctermbg=234 ctermfg=darkred cterm=NONE
au FileType * hi Search ctermbg=236 ctermfg=darkred
au FileType * hi vimTodo ctermbg=236 ctermfg=darkred
au FileType * hi Todo ctermbg=236 ctermfg=darkred
au FileType * hi IncSearch ctermbg=236 cterm=NONE ctermfg=darkred
au FileType * hi MatchParen ctermbg=236 ctermfg=darkred
au FileType * hi SignColumn ctermbg=NONE ctermfg=darkred
au FileType markdown,pandoc hi Title ctermfg=yellow ctermbg=NONE
au FileType markdown,pandoc hi Operator ctermfg=yellow ctermbg=NONE
au FileType yaml hi yamlBlockMappingKey ctermfg=NONE
au FileType bash set sw=2
au FileType c set sw=8
