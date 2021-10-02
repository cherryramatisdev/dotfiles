local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/treesitter.fnl"
local _2amodule_name_2a = "dotfiles.plugin.treesitter"
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
local nvim, treesitter = autoload("aniseed.nvim"), autoload("nvim-treesitter.configs")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["treesitter"] = treesitter
return treesitter.setup({ensure_installed = "all", highlight = {enable = true, additional_vim_regex_highlighting = false}})