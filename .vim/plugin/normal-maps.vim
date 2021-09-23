" Alternate buffer (easier than <C-^>)
nmap <leader><leader> <c-^>

" Quit vim quickly
nnoremap <leader>q ZZ

nnoremap <leader>w :w<cr>

" See http://stevelosh.com/blog/2010/09/coming-home-to-vim
nnoremap / /\v

" Resize splits
nnoremap <C-h> :vertical resize -4<cr>
nnoremap <C-l> :vertical resize +4<cr>
nnoremap <C-k> :resize +4<cr>
nnoremap <C-j> :resize -4<cr>

" Why this isn't default
nnoremap Y y$

" Open my projectile like script to switch projects with tmux
nnoremap <silent> <C-x><C-p> :silent !tmux split-window -v tmux-sessionizer<cr>

" Rename a buffer
function! s:RenameBuffer() abort
  let l:name = input('Buffer name: ')

  if empty(l:name)
    return
  endif

  execute 'file ' . l:name
endfunction

nnoremap <leader>r :call <SID>RenameBuffer()<cr>

" Navigate tab
nnoremap <leader>h :tabprev<cr>
nnoremap <leader>l :tabnext<cr>

" Open general todos
nnoremap <leader>ot :Todo g<cr>
