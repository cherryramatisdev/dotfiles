local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/todo.fnl"
local _2amodule_name_2a = "dotfiles.plugin.todo"
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
local t = autoload("todo-comments")
do end (_2amodule_locals_2a)["t"] = t
return t.setup()