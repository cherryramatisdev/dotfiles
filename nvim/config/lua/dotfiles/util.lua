local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/util.fnl"
local _2amodule_name_2a = "dotfiles.util"
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
local nvim = require("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
local function load_plugin(plugin)
  return vim.cmd(("packadd " .. plugin))
end
_2amodule_2a["load-plugin"] = load_plugin
return _2amodule_2a