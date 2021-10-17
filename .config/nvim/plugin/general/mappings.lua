-- Common leader mappings
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "ZZ", { noremap = true })

vim.api.nvim_set_keymap("n", "ss", "<C-w>s", { noremap = true })
vim.api.nvim_set_keymap("n", "sv", "<C-w>v", { noremap = true })
vim.api.nvim_set_keymap("n", "so", "<C-w>o", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })

-- Quickly navigate between windows
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", { noremap = true })

-- Resize windows
vim.api.nvim_set_keymap("n", "<C-w><C-h>", "<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><C-l>", "<C-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><C-k>", "<C-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<C-w><C-j>", "<C-w>-", { noremap = true })

-- Use <C-o> to exit insert mode in terminal and insert mode
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>`^", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-o>", [[<C-\><C-n>]], { noremap = true })
