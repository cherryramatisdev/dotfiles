local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/trouble.fnl"
local _2amodule_name_2a = "dotfiles.plugin.trouble"
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
local t = autoload("trouble")
do end (_2amodule_locals_2a)["t"] = t
return t.setup()