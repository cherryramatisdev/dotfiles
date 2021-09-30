local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/cherry/file-management.fnl"
local _2amodule_name_2a = "dotfiles.cherry.file-management"
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
local function my_2fdelete()
  vim.api.nvim_command(string.format("silent ! rm -rf %s/%s", nvim.fn.expand("%"), nvim.fn.getline(".")))
  return vim.api.nvim_exec("normal \\<C-l>", true)
end
_2amodule_locals_2a["my/delete"] = my_2fdelete
local function my_2fdelete2()
  vim.api.nvim_command(string.format("silent ! rm -rf %s", nvim.fn.getline(".")))
  return vim.api.nvim_exec("normal \\<C-l>", true)
end
_2amodule_locals_2a["my/delete2"] = my_2fdelete2
local function delete_file()
  local should_delete = nvim.fn.confirm("Are you sure that want to delete?", "&Yes\n&No", 1)
  if (should_delete == 1) then
    if (nvim.fn.len("%") > 0) then
      return my_2fdelete()
    else
      return my_2fdelete2()
    end
  else
    return nil
  end
end
_2amodule_2a["delete_file"] = delete_file