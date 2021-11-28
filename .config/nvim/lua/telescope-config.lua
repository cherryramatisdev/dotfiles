local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		prompt_prefix = " >",
		color_devicons = true,
		mappings = {
			i = {
				["<Esc>"] = actions.close,
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
		fzy_native = {
			override_generic_sorter = false,
			override_file_sorter = true,
		},
	},
})

require("telescope").load_extension("fzy_native")
