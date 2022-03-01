if vim.fn.exists("$TMUX") then
  vim.cmd [[ 
	let g:test#strategy = 'vimux' " run tests in a split tmux pane if available
	]]
  vim.g.VimuxUseNearest = 0
elseif vim.fn.has("nvim") then
  vim.cmd [[ 
	  let g:test#strategy = 'neovim'
	  ]]
end
-- TODO: test bindings for this
-- nnoremap <silent> <Leader>t :TestFile<CR>
-- nnoremap <silent> <Leader>s :TestNearest<CR>
-- nnoremap <silent> <leader>l :TestLast<CR>
-- nnoremap <silent> <Leader>a :TestSuite<CR>
-- nnoremap <silent> <Leader>gt :TestVisit<CR>
