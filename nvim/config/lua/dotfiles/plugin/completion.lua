local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/completion.fnl"
local _2amodule_name_2a = "dotfiles.plugin.completion"
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
nvim.o.completeopt = "menuone,noselect,noinsert,preview"
nvim.o.shortmess = (nvim.o.shortmess .. "c")
nvim.g["mucomplete#enable_auto_at_startup"] = 1
nvim.g["mucomplete#chains"] = {all = {"file", "omni", "keyn"}}
util["load-plugin"]("vim-mucomplete")
return _2amodule_2a