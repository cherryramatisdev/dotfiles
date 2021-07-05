local _2afile_2a = ".config/nvim/fnl/cherry/plugin/git.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.git"
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
    return {autoload("neogit"), autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {neogit = "neogit", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local neogit = _local_0_[1]
local nvim = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.git"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
neogit.setup({})
return nvim.set_keymap("n", "<leader>g", ":Neogit<CR>", {noremap = true})