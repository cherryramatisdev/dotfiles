local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/fuzzy.fnl"
local _2amodule_name_2a = "dotfiles.fuzzy"
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
local function return_cmd()
  if nvim.fn.stridx(nvim.fn.system("git status"), "not in") then
    return "fd . -t f"
  else
    return "git ls-files"
  end
end
_2amodule_locals_2a["return-cmd"] = return_cmd
local function files_picker(a, l, p)
  local cmd = return_cmd()
  local items = nvim.fn.systemlist(cmd)
  if (#a > 0) then
    return nvim.fn.matchfuzzy(items, a)
  else
    return items
  end
end
_2amodule_2a["files_picker"] = files_picker
local function files_edit(direction, args)
  return nvim.fn.execute((direction .. " " .. args))
end
_2amodule_2a["files_edit"] = files_edit
local function _3_(tbl)
  return files_edit("e", tbl.args)
end
vim.api.nvim_create_user_command("E", _3_, {nargs = 1, bar = true, complete = files_picker})
local function _4_(tbl)
  return files_edit("sp", tbl.args)
end
vim.api.nvim_create_user_command("S", _4_, {nargs = 1, bar = true, complete = files_picker})
local function _5_(tbl)
  return files_edit("vs", tbl.args)
end
vim.api.nvim_create_user_command("V", _5_, {nargs = 1, bar = true, complete = files_picker})
local function _6_(tbl)
  return files_edit("tabe", tbl.args)
end
vim.api.nvim_create_user_command("T", _6_, {nargs = 1, bar = true, complete = files_picker})
return _2amodule_2a