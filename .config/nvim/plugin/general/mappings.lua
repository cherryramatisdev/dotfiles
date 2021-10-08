-- Common leader mappings
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "ZZ", { noremap = true })

-- Quickly navigate between windows
vim.api.nvim_set_keymap("n", "<C-h>", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-j>", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-k>", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-l>", "<C-w>l", { noremap = true })

-- Use <C-o> to exit insert mode in pretty much everything
vim.api.nvim_set_keymap("n", "<C-o>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("v", "<C-o>", "<Esc>gV", { noremap = true })
vim.api.nvim_set_keymap("o", "<C-o>", "<Esc>", { noremap = true })
vim.api.nvim_set_keymap("c", "<C-o>", "<C-c><Esc>", { noremap = true })
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>`^", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-o>", [[<C-\><C-n>]], { noremap = true })
