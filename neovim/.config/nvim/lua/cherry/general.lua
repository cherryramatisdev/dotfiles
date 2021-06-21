-- Configuring tab to be two spaces
vim.g.tabstop = 2
vim.g.expandtab = true
vim.g.softtabstop = 2
vim.g.shiftwidth = 2

vim.wo.number = true
vim.wo.relativenumber = true

vim.cmd [[ set splitright ]]
vim.cmd [[ set splitbelow ]]

vim.cmd [[ set guicursor= ]]

vim.cmd [[ set hidden ]]

vim.cmd [[ set nowrap ]]

vim.cmd [[ set clipboard=unnamedplus ]]

if vim.fn.exists("##TextYankPost") == 1 then
  vim.cmd [[
  augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
  augroup END
  ]]
end
