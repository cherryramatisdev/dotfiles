vim.cmd [[ noremap Q !!sh<CR> ]]

-- Allow saving of files as sudo when I forgot to start vim using sudo.
vim.cmd [[ cmap w!! w !sudo tee > /dev/null % ]]

-- Quit vim quickly
vim.cmd [[ nnoremap <leader>q ZZ ]]

-- See http://stevelosh.com/blog/2010/09/coming-home-to-vim
vim.cmd [[ nnoremap / /\v ]]
vim.cmd [[ vnoremap / /\v ]]

-- Disable highlight when <leader><cr> is pressed
vim.cmd [[ map <silent> <leader><cr> :noh<cr> ]]

vim.cmd [[ nnoremap <leader>w <C-w>v<C-w>l ]]

-- Open window below instead of above"
vim.cmd [[ nnoremap <c-w>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR> ]]

-- Vertical equivalent of c-w-n and c-w-N"
vim.cmd [[ nnoremap <c-w>v :vnew<CR> ]]
vim.cmd [[ nnoremap <c-w>V :let spr=&spr<BAR>set nospr<BAR>vnew<BAR>let &spr=spr<CR> ]]

-- Spell checking for git commit messages
vim.cmd [[
if has("autocmd")
  augroup GitCommitSpellCheck
    autocmd!
    autocmd FileType gitcommit set spell
  augroup END
endif
]]

