local _2afile_2a = ".config/nvim/fnl/cherry/mapping.fnl"
local _0_
do
  local name_0_ = "cherry.mapping"
  local module_0_
  do
    local x_0_ = package.loaded[name_0_]
    if ("table" == type(x_0_)) then
      module_0_ = x_0_
    else
      module_0_ = {}
    end
  end
  module_0_["aniseed/module"] = name_0_
  module_0_["aniseed/locals"] = ((module_0_)["aniseed/locals"] or {})
  do end (module_0_)["aniseed/local-fns"] = ((module_0_)["aniseed/local-fns"] or {})
  do end (package.loaded)[name_0_] = module_0_
  _0_ = module_0_
end
local autoload
local function _1_(...)
  return (require("aniseed.autoload")).autoload(...)
end
autoload = _1_
local function _2_(...)
  local ok_3f_0_, val_0_ = nil, nil
  local function _2_()
    return {autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local nvim = _local_0_[1]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.mapping"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local noremap
do
  local v_0_
  local function noremap0(mode, from, to)
    return nvim.set_keymap(mode, from, to, {noremap = true})
  end
  v_0_ = noremap0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["noremap"] = v_0_
  noremap = v_0_
end
nvim.g.mapleader = " "
nvim.g.maplocalleader = ","
noremap("n", ";", ":")
noremap("n", "gl", "$")
noremap("n", "gh", "^")
noremap("n", "<leader>fs", ":w<CR>")
noremap("n", "<leader>bd", ":bd<CR>")
noremap("n", "<leader>wd", ":q<CR>")
noremap("n", "<leader>ws", "<C-w>s")
noremap("n", "<leader>wv", "<C-w>v")
noremap("n", "<leader>wo", "<C-w>o")
noremap("n", "<leader>qq", ":wqall<CR>")
noremap("n", "<C-h>", "<C-w>h")
noremap("n", "<C-j>", "<C-w>j")
noremap("n", "<C-k>", "<C-w>k")
noremap("n", "<C-l>", "<C-w>l")
return noremap("t", "<Esc>", "<C-\\><C-n>", {noremap = true})