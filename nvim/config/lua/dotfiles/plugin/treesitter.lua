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
local util = require("dotfiles.util")
do end (_2amodule_locals_2a)["util"] = util
util["load-plugin"]("nvim-treesitter")
do
  local ok_3f, ts = pcall(require, "nvim-treesitter.configs")
  if ok_3f then
    ts.setup({indent = {enable = true}, highlight = {enable = true, additional_vim_regex_highlighting = false}})
  else
  end
end
return _2amodule_2a