local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/org.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.org"
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
    return {autoload("aniseed.nvim"), autoload("orgmode")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {nvim = "aniseed.nvim", org = "orgmode"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local nvim = _local_0_[1]
local org = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.org"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
return org.setup({org_agenda_files = {"~/org/*"}, org_default_notes_file = "~/org/notes.org"})