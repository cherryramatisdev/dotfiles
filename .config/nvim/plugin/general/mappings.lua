local nnoremap = vim.keymap.nnoremap
local inoremap = vim.keymap.inoremap
local tnoremap = vim.keymap.tnoremap

-- Common leader mappings
nnoremap { "<leader>w", [[:w<cr>]] }
nnoremap { "<leader>q", [[ZZ]] }

nnoremap { "<space>", [[<C-w>w]] }
nnoremap { "ss", [[<C-w>s]] }
nnoremap { "sv", [[<C-w>v]] }
nnoremap { "so", [[<C-w>o]] }

-- Quickly navigate between windows
nnoremap { "sh", [[<C-w>h]] }
nnoremap { "sj", [[<C-w>j]] }
nnoremap { "sk", [[<C-w>k]] }
nnoremap { "sl", [[<C-w>l]] }

-- Resize windows
nnoremap { "<Left>", [[<C-w><]] }
nnoremap { "<Right>", [[<C-w>>]] }
nnoremap { "<Up>", [[<C-w>+]] }
nnoremap { "<Down>", [[<C-w>-]] }

-- Use <C-o> to exit insert mode in terminal and insert mode
inoremap { "<C-o>", [[<Esc>`^]] }
tnoremap { "<C-o>", [[<C-\><C-n>]] }

-- Switch project
nnoremap { "<C-f>", [[:silent !ta ~/projects/work/<cr>]] }
