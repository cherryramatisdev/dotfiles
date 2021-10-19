-- Common leader mappings
vim.api.nvim_set_keymap("n", "<leader>w", ":w<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>q", "ZZ", { noremap = true })

vim.api.nvim_set_keymap("n", "<space>", "<C-w>w", { noremap = true })
vim.api.nvim_set_keymap("n", "ss", "<C-w>s", { noremap = true })
vim.api.nvim_set_keymap("n", "sv", "<C-w>v", { noremap = true })
vim.api.nvim_set_keymap("n", "so", "<C-w>o", { noremap = true })

-- Quickly navigate between windows
vim.api.nvim_set_keymap("n", "sh", "<C-w>h", { noremap = true })
vim.api.nvim_set_keymap("n", "sj", "<C-w>j", { noremap = true })
vim.api.nvim_set_keymap("n", "sk", "<C-w>k", { noremap = true })
vim.api.nvim_set_keymap("n", "sl", "<C-w>l", { noremap = true })

-- Resize windows
vim.api.nvim_set_keymap("n", "<Left>", "<C-w><", { noremap = true })
vim.api.nvim_set_keymap("n", "<Right>", "<C-w>>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Up>", "<C-w>+", { noremap = true })
vim.api.nvim_set_keymap("n", "<Down>", "<C-w>-", { noremap = true })

-- Use <C-o> to exit insert mode in terminal and insert mode
vim.api.nvim_set_keymap("i", "<C-o>", "<Esc>`^", { noremap = true })
vim.api.nvim_set_keymap("t", "<C-o>", [[<C-\><C-n>]], { noremap = true })

-- Switch project
-- TODO: Transform this on lua
vim.cmd [[ nnoremap <C-x><C-p> :silent !tmux split-window -h tmux-sessionizer<cr>]]
