local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/colorscheme.fnl"
local _2amodule_name_2a = "dotfiles.plugin.colorscheme"
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
local nvim, util = require("aniseed.nvim"), require("dotfiles.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
util["load-plugin"]("srcery-vim")
nvim.ex.colorscheme("srcery")
return _2amodule_2a