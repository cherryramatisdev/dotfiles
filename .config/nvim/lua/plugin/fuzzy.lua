local actions = require("telescope.actions")
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-n>"] = actions.cycle_history_next,
        ["<C-p>"] = actions.cycle_history_prev,
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<CR>"] = actions.select_default + actions.center
      },
      n = {
        ["<C-c>"] = actions.close,
        ["<Esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}

local nnoremap = vim.keymap.nnoremap

nnoremap {"<space><space>", "<cmd>Telescope find_files<cr>"}
nnoremap {"<space>ff", "<cmd>Telescope file_browser<cr>"}
nnoremap {"<space>ps", "<cmd>Telescope live_grep<cr>"}
nnoremap {"<space>bb", "<cmd>Telescope buffers<cr>"}
nnoremap {"<space>h", "<cmd>Telescope help_tags<cr>"}
