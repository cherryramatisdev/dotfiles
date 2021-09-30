local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/general/sets.fnl"
local _2amodule_name_2a = "dotfiles.general.sets"
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
local nvim = autoload("aniseed.nvim")
do end (_2amodule_locals_2a)["nvim"] = nvim
nvim.o.termguicolors = true
nvim.o.swapfile = false
nvim.o.hlsearch = false
nvim.o.cursorline = true
nvim.o.showmode = false
nvim.o.ignorecase = true
nvim.o.smartcase = true
nvim.o.textwidth = 80
nvim.o.number = true
nvim.o.relativenumber = true
nvim.o.hidden = true
nvim.o.laststatus = 2
nvim.o.showtabline = 2
nvim.o.switchbuf = "useopen"
nvim.o.showfulltag = true
nvim.o.incsearch = true
nvim.o.visualbell = false
nvim.o.errorbells = false
nvim.o.splitbelow = true
nvim.o.splitright = true
nvim.o.clipboard = (nvim.o.clipboard .. "unnamedplus")
nvim.o.undofile = false
nvim.o.swapfile = false
nvim.o.backup = false
nvim.o.path = (nvim.o.path .. "**")
nvim.o.autoread = true
nvim.o.autoindent = true
nvim.o.copyindent = true
nvim.o.smartindent = true
nvim.o.mouse = "a"
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
return nil