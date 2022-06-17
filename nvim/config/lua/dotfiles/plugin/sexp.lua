local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/sexp.fnl"
local _2amodule_name_2a = "dotfiles.plugin.sexp"
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
local nvim, util = autoload("aniseed.nvim"), autoload("dotfiles.util")
do end (_2amodule_locals_2a)["nvim"] = nvim
_2amodule_locals_2a["util"] = util
nvim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel,janet"
util["load-plugin"]("vim-sexp")
util["load-plugin"]("vim-sexp-mappings-for-regular-people")
return _2amodule_2a