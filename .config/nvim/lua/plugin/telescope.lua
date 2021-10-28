local actions = require "telescope.actions"

require("telescope").setup {
  pickers = {
    buffers = {
      mappings = {
        i = {
          ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
        },
      },
    },
  },
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
        ["<C-l>"] = actions.select_default,
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
    arecibo = {
      ["selected_engine"] = "google",
      ["url_open_command"] = "brave",
      ["show_http_headers"] = false,
      ["show_domain_icons"] = false,
    },
  },
}

require("telescope").load_extension "fzy_native"
require("telescope").load_extension "project"
require("telescope").load_extension "arecibo"

-- The new world of bindings babe
vim.keymap.nnoremap { "<leader>f", [[:Telescope find_files hidden=true<cr>]] }
vim.keymap.nnoremap { "<leader>r", [[:Telescope live_grep hidden=true<CR>]] }
vim.keymap.nnoremap { "\\", ":Telescope buffers hidden=true<CR>" }
vim.keymap.nnoremap { "<leader>;", [[:Telescope commands hidden=true<CR>]] }
vim.keymap.nnoremap { "<leader>* ", [[:Telescope grep_string hidden=true<CR>]] }
vim.keymap.nnoremap { "<leader>p", [[:Telescope project hidden=true<CR>]] }
vim.keymap.nnoremap { "gG", [[:lua require'telescope'.extensions.arecibo.websearch()<cr>]] }
