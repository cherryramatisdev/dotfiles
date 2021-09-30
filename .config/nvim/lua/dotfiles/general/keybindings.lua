local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/general/keybindings.fnl"
local _2amodule_name_2a = "dotfiles.general.keybindings"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.set_keymap("n", "<leader>w", ":w<cr>", {noremap = true})
return nvim.set_keymap("n", "<leader>q", "ZZ", {noremap = true})