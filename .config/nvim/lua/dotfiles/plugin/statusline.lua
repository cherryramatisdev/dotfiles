local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/statusline.fnl"
local _2amodule_name_2a = "dotfiles.plugin.statusline"
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
local line = autoload("statusline")
do end (_2amodule_locals_2a)["line"] = line
line.tabline = false
line.lsp_diagnostics = false
line.ale_diagnostics = false
return nil