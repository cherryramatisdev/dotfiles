local Utils = require("cherry.utils")

local actions = require("telescope.actions")
-- Global remapping
------------------------------
require("telescope").setup {
  defaults = {
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist,
        ["<esc>"] = actions.close,
        -- Add up multiple actions
        ["<cr>"] = actions.select_default + actions.center
      },
      n = {
        ["<esc>"] = actions.close,
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<C-q>"] = actions.smart_send_to_qflist + actions.open_qflist
      }
    }
  }
}

Utils.noremap("n", "<leader><leader>", '<cmd>lua require("telescope.builtin").find_files(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>/", '<cmd>lua require("telescope.builtin").live_grep(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>,", '<cmd>lua require("telescope.builtin").buffers(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>.", '<cmd>lua require("telescope.builtin").file_browser(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>H", '<cmd>lua require("telescope.builtin").help_tags(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>ss", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })
Utils.noremap("n", "<leader>gs", '<cmd>lua require("telescope.builtin").git_status(require("telescope.themes").get_dropdown({}))<CR>', { noremap = true })

local M = {}

M.search_todos = function()
  require('telescope.builtin').find_files({
    prompt_title = "< TODOS >",
    cwd = "~/org/"
  })
end

return M
