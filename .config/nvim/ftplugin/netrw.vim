nmap <buffer> l <cr>
nmap <buffer> h -
nmap <buffer> a %
nmap <buffer> d <Nop>
nmap <buffer> dc <Plug>NetrwMakeDir("")
nmap <buffer> dd :lua require('dotfiles.cherry.file-management').delete_file()<CR>

