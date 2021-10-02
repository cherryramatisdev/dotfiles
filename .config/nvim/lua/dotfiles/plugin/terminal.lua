local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/terminal.fnl"
local _2amodule_name_2a = "dotfiles.plugin.terminal"
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
local nvim, t = autoload("aniseed.nvim"), autoload("toggleterm")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["t"] = t
t.setup({size = 20, open_mappings = "<c-t>", hide_numbers = true, shade_terminals = true, start_in_insert = true, insert_mappings = true, persist_size = true, direction = "float", close_on_exit = true})
nvim.set_keymap("n", "<c-t>", ":ToggleTerm<cr>", {noremap = true})
return nvim.set_keymap("t", "<c-t>", "<cmd>ToggleTerm<cr>", {noremap = true})