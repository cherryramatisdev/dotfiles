---@diagnostic disable: undefined-global
local M = {}
local actions = require("telescope.actions")

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--follow",
			"-g",
			"!.git/",
		},
		prompt_prefix = " >",
		color_devicons = true,
		mappings = {
			i = {
				["<C-s>"] = actions.select_horizontal,
				["<C-v>"] = actions.select_vertical,
				["<C-q>"] = actions.send_to_qflist,
			},
		},
	},
	extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case"
    },
		file_browser = {
			theme = "ivy",
		},
	},
})

require("telescope").load_extension("fzf")

function M.project_search()
  require('telescope.builtin').git_files {
    previewer = false,
    shorten_path = true,
    hidden = true,
    layout_strategy = "horizontal",
    cwd = require('lspconfig.util').root_pattern(".git")(vim.fn.expand("%:p")),
  }
end

function M:anime_selector()
	require("telescope.builtin").find_files({
		prompt_title = "< Anime wallpapers >",
		cwd = "~/wallpapers",
		attach_mappings = function(prompt_bufnr, map)
			local function delete_file(close)
				local current_picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)
				local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)

				vim.cmd(string.format("silent !rm -rf %s", content.cwd .. "/" .. content.value))

				current_picker:refresh()

				if close then
					require("telescope.actions").close(prompt_bufnr)
				end
			end

			local function set_background(type)
				local content = require("telescope.actions.state").get_selected_entry(prompt_bufnr)

				vim.cmd(string.format("silent !feh --bg-fill %s", content.cwd .. "/" .. content.value))

				if type == "next" then
					require("telescope.actions").move_selection_next(prompt_bufnr)
				elseif type == "previous" then
					require("telescope.actions").move_selection_previous(prompt_bufnr)
				elseif type == "close" then
					require("telescope.actions").close(prompt_bufnr)
				end
			end

			map("i", "<C-d>", function()
				delete_file()
			end)

			map("i", "<CR>", function()
				set_background("close")
			end)

			map("i", "<C-p>", function()
				set_background("previous")
			end)

			map("i", "<C-n>", function()
				set_background("next")
			end)

			map("i", "<C-r>", function(bufnr)
				vim.cmd("silent ! feh --bg-fill --randomize ~/wallpapers")

				require("telescope.actions").close(bufnr)
			end)

			return true
		end,
	})
end

function M:find_dotfiles()
	require("telescope.builtin").find_files({
		prompt_title = "< Dotfiles >",
		cwd = "~/projects/dotfiles",
		hidden = true,
	})
end

function M:find_notes()
  require('telescope.builtin').find_files({
    prompt_title = "< Notes >",
    cwd = "~/vimwiki/"
  })
end

return M
