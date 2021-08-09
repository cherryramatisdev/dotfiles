local actions = require("telescope.actions")
require("telescope").setup {
    defaults = {
        vimgrep_arguments = {"rg", "--color=never", "--no-heading",
        "--with-filename", "--line-number", "--column",
        "--smart-case", "--hidden", "--follow",
        "-g", "!.git/"},
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
    },
}
