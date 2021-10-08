local actions = require "telescope.actions"

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,

    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      },
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    project = {
      hidden_files = true,
    },
  },
}

require("telescope").load_extension "fzy_native"
require("telescope").load_extension "project"

vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>pp", ":Telescope project hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>f-", ":Telescope file_browser hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fg", ":Telescope live_grep hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>* ", ":Telescope grep_string hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fb", ":Telescope buffers hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fH", ":Telescope help_tags hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fm", ":Telescope keymaps hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fM", ":Telescope marks hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fh", ":Telescope oldfiles hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ft", ":Telescope filetypes hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fc", ":Telescope commands hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fC", ":Telescope command_history hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fq", ":Telescope quickfix hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>fl", ":Telescope loclist hidden=true<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>la", ":Telescope lsp_code_actions<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>li", ":Telescope lsp_implementations<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>lr", ":Telescope lsp_references<cr>", { noremap = true })
