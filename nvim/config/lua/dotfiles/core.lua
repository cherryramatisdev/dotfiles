local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/core.fnl"
local _2amodule_name_2a = "dotfiles.core"
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
nvim.o.autowrite = true
local tabwidth = 2
_2amodule_locals_2a["tabwidth"] = tabwidth
nvim.o.tabstop = tabwidth
nvim.o.softtabstop = tabwidth
nvim.o.shiftwidth = tabwidth
nvim.o.smartindent = true
nvim.o.expandtab = true
nvim.o.splitright = true
nvim.o.splitbelow = true
nvim.o.number = true
nvim.o.relativenumber = true
nvim.o.clipboard = "unnamedplus"
nvim.o.guicursor = ""
nvim.o.laststatus = 3
nvim.o.winbar = "%f %m"
nvim.o.backup = false
nvim.o.swapfile = false
nvim.o.writebackup = false
nvim.o.linebreak = true
if nvim.fn.executable("rg") then
  nvim.o.grepprg = "rg --vimgrep --smart-case --hidden"
  nvim.o.grepformat = "%f:%l:%c:%m"
else
end
vim.keymap.set("n", "[q", "<cmd>cprev<cr>")
vim.keymap.set("n", "]q", "<cmd>cnext<cr>")
return _2amodule_2a