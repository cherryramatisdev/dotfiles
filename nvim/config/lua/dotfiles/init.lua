local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/init.fnl"
local _2amodule_name_2a = "dotfiles.init"
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
require("dotfiles.core")
require("dotfiles.statusline")
require("dotfiles.fuzzy")
util["load-plugin"]("vim-commentary")
util["load-plugin"]("vim-surround")
util["load-plugin"]("vim-vinegar")
util["load-plugin"]("vim-dispatch")
util["load-plugin"]("vim-jack-in")
local function plugin_config_require(name)
  local ok_3f, val_or_err = pcall(require, ("dotfiles.plugin." .. name))
  if not ok_3f then
    return print(("dotfiles error: " .. val_or_err))
  else
    return nil
  end
end
_2amodule_2a["plugin-config-require"] = plugin_config_require
plugin_config_require("treesitter")
plugin_config_require("sexp")
plugin_config_require("colorscheme")
plugin_config_require("completion")
return _2amodule_2a