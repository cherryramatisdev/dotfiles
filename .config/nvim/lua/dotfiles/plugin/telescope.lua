local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/telescope.fnl"
local _2amodule_name_2a = "dotfiles.plugin.telescope"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local autoload = (require("aniseed.autoload")).autoload
local actions, nvim, telescope = autoload("telescope.actions"), autoload("aniseed.nvim"), autoload("telescope")
do end (_2amodule_locals_2a)["actions"] = actions
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["telescope"] = telescope
telescope.setup({defaults = {vimgrep_arguments = {"rg", "--color=never", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case", "--hidden", "--follow", "-g", "!.git/"}}, mappings = {i = {[{"<C-j>"}] = actions.move_selection_next, [{"<C-k>"}] = actions.move_selection_previous, [{"<esc>"}] = actions.close}, n = {[{"<C-j>"}] = actions.move_selection_next, [{"<C-k>"}] = actions.move_selection_previous, [{"<esc>"}] = actions.close}}})
telescope.load_extension("projects")
nvim.set_keymap("n", "<leader>pp", ":Telescope projects hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>ff", ":Telescope find_files hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>f-", ":Telescope file_browser hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fg", ":Telescope live_grep hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>*", ":Telescope grep_string hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fb", ":Telescope buffers hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fH", ":Telescope help_tags hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fm", ":Telescope keymaps hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fM", ":Telescope marks hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fh", ":Telescope oldfiles hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>ft", ":Telescope filetypes hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fc", ":Telescope commands hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fC", ":Telescope command_history hidden=true<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>fq", ":Telescope quickfix hidden=true<CR>", {noremap = true})
return nvim.set_keymap("n", "<leader>fl", ":Telescope loclist hidden=true<CR>", {noremap = true})