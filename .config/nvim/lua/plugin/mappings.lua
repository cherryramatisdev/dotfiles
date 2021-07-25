vim.g.mapleader = " "
local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local tnoremap = vim.keymap.tnoremap
local vnoremap = vim.keymap.vnoremap
local onoremap = vim.keymap.onoremap

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

-- Run current file with proper command
nnoremap { "<leader><CR>", ":lua require('cherry.utils').run_current_file()<CR>" }

-- Expand words
inoremap { "<C-t>", "<Esc>:lua require('cherry.expander').expand_tags(); vim.cmd('norm! dd$T>')<CR>i" }

-- Easymotion
nnoremap { "<leader>j", ":HopLineAC<CR>" }
nnoremap { "<leader>k", ":HopLineBC<CR>" }
nnoremap { "<leader>l", ":HopWord<CR>" }
onoremap { "<leader>j", ":HopLineAC<CR>" }
onoremap { "<leader>k", ":HopLineBC<CR>" }
onoremap { "<leader>l", ":HopWord<CR>" }

-- PRIMEAGEN SESSION

-- Harpoon
nnoremap {"<leader>a", ":lua require('harpoon.mark').add_file()<CR>" }
nnoremap {"<C-e>", ":lua require('harpoon.ui').toggle_quick_menu()<CR>" }
nnoremap {"<leader>1", ":lua require('harpoon.term').gotoTerminal(1)<CR>"}
nnoremap {"<leader>2", ":lua require('harpoon.term').gotoTerminal(2)<CR>"}
nnoremap {"<leader>3", ":lua require('harpoon.term').gotoTerminal(3)<CR>"}
nnoremap {"<leader>4", ":lua require('harpoon.term').gotoTerminal(4)<CR>"}
nnoremap {"<leader>5", ":lua require('harpoon.term').gotoTerminal(5)<CR>"}
nnoremap { ",a", ":lua require('harpoon.ui').nav_file(1)<CR>" }
nnoremap { ",s", ":lua require('harpoon.ui').nav_file(2)<CR>" }
nnoremap { ",d", ":lua require('harpoon.ui').nav_file(3)<CR>" }
nnoremap { ",f", ":lua require('harpoon.ui').nav_file(4)<CR>" }

-- Refactoring
vnoremap { "<leader>re", ":lua require('refactoring.106').extract()<CR>" }
