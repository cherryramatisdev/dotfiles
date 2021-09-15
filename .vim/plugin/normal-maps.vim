" Alternate buffer (easier than <C-^>)
nmap <leader><leader> <c-^>

" Quit vim quickly
nnoremap <leader>q ZZ

" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v

" Disable highlight when <leader><cr> is pressed
map <silent> <leader><cr> :noh<cr>

" Quickly open terminal
nnoremap <leader>t :term<cr>

" Resize splits
nnoremap <M-h> :vertical resize -4<cr>
nnoremap <M-l> :vertical resize +4<cr>
nnoremap <M-k> :resize +4<cr>
nnoremap <M-j> :resize -4<cr>

" Why this isn't default
nnoremap Y y$

" Open my projectile like script to switch projects with tmux
nnoremap <silent> <C-x><C-p> :silent !tmux split-window -v tmux-sessionizer<cr>
