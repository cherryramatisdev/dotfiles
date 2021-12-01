lua require('telescope-config')

nnoremap <leader>ps :lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({ search = vim.fn.input("Grep For > ") }))<CR>
nnoremap <C-p> :Telescope git_files theme=ivy<cr>
nnoremap <leader>pf :Telescope find_files theme=ivy<cr>

nnoremap <leader>pw :lua require('telescope.builtin').grep_string(require('telescope.themes').get_ivy({ search = vim.fn.expand("<cword>") }))<CR>
nnoremap <leader>pb :Telescope buffers theme=ivy<cr>
nnoremap <leader>gc :Telescope git_branches theme=ivy<cr>
nnoremap <leader>va :lua require('telescope-config').anime_selector()<CR>
nnoremap <leader>vrc :lua require('telescope-config').find_dotfiles()<CR>
nnoremap <leader>e :lua require'telescope'.extensions.file_browser.file_browser()<CR>
