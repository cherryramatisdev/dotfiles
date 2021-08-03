set background=dark
" Discover how to use colorscheme g:cherry_colorscheme direct on vimscript
call luaeval('vim.cmd("colorscheme " .. _A[1])', [g:cherry_colorscheme])
