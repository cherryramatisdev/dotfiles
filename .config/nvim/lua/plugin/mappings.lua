vim.g.mapleader = " "
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local tnoremap = vim.keymap.tnoremap

inoremap {"<C-j>", "<C-n>"}
inoremap {"<C-k>", "<C-p>"}

nnoremap {";", ":"}
nnoremap {"<leader>fs", ":w<CR>"}
nnoremap {"<leader>ws", "<C-w>s"}
nnoremap {"<leader>wv", "<C-w>v"}
nnoremap {"<leader>wd", ":wq<CR>"}
nnoremap {"<leader>bd", ":bd<CR>"}

nnoremap {"<C-h>", "<C-w>h"}
nnoremap {"<C-j>", "<C-w>j"}
nnoremap {"<C-k>", "<C-w>k"}
nnoremap {"<C-l>", "<C-w>l"}

-- nnoremap {"<leader>g", ":Neogit<CR>"}
nnoremap {"<leader>=", ":Format<CR>"}

nnoremap {"t<C-n>", ":TestNearest<CR>"}
nnoremap {"t<C-f>", ":TestFile<CR>"}
nnoremap {"t<C-s>", ":TestSuite<CR>"}
nnoremap {"t<C-l>", ":TestLast<CR>"}
nnoremap {"t<C-g>", ":TestVisit<CR>"}

tnoremap {"<C-]>", "<C-\\><C-n>"}

nnoremap {"<leader>ns", ":lua require('cherry.runner').npm_install()<CR>"}
nnoremap {"<leader>nd", ":lua require('cherry.runner').npm_install_dev()<CR>"}

-- Harpoon
-- TODO: discover how to use this for navigating files, I'm just using it for navigating terminals
nnoremap {"<leader>1", ":lua require('harpoon.term').gotoTerminal(1)<CR>"}
nnoremap {"<leader>2", ":lua require('harpoon.term').gotoTerminal(2)<CR>"}
nnoremap {"<leader>3", ":lua require('harpoon.term').gotoTerminal(3)<CR>"}
nnoremap {"<leader>4", ":lua require('harpoon.term').gotoTerminal(4)<CR>"}
nnoremap {"<leader>5", ":lua require('harpoon.term').gotoTerminal(5)<CR>"}
