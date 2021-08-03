" Moving text
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Add surrounds on visual modes
vnoremap " <esc>`>a"<esc>`<i"<esc>
vnoremap ' <esc>`>a'<esc>`<i'<esc>
vnoremap ( <esc>`>a)<esc>`<i(<esc>
vnoremap [ <esc>`>a]<esc>`<i[<esc>
vnoremap { <esc>`>a}<esc>`<i{<esc>
