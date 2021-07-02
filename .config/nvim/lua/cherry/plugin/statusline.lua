local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/statusline.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.statusline"
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
    return {autoload("aniseed.nvim.util"), autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {nu = "aniseed.nvim.util", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local nu = _local_0_[1]
local nvim = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.statusline"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
local expand
do
  local v_0_
  local function expand0(s)
    return nvim.fn.expand(s)
  end
  v_0_ = expand0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["expand"] = v_0_
  expand = v_0_
end
local filename
do
  local v_0_
  do
    local v_0_0
    local function filename0()
      return expand("%")
    end
    v_0_0 = filename0
    _0_["filename"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["filename"] = v_0_
  filename = v_0_
end
local readonly
do
  local v_0_
  do
    local v_0_0
    local function readonly0()
      if (nvim.bo.readonly and (nvim.bo.filetype ~= "help")) then
        return "RO"
      else
        return ""
      end
    end
    v_0_0 = readonly0
    _0_["readonly"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["readonly"] = v_0_
  readonly = v_0_
end
local bridge
do
  local v_0_
  local function bridge0(from, to)
    return nu["fn-bridge"](from, "cherry.plugin.statusline", to, {["return"] = true})
  end
  v_0_ = bridge0
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["bridge"] = v_0_
  bridge = v_0_
end
bridge("LightlineFilename", "filename")
bridge("LightlineReadonly", "readonly")
nvim.g.lightline = {active = {left = {{"mode", "paste"}, {"readonly", "filename", "modified", "gitbranch"}}, right = {}}, colorscheme = "default", component_function = {filename = "LightlineFilename", gitbranch = "gitbranch#name", readonly = "LightlineReadonly"}, inactive = {left = {{"filename"}}, right = {}}}
return nil