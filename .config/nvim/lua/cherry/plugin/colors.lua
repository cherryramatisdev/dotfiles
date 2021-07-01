local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/colors.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.colors"
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
    _0_["aniseed/local-fns"] = {["require-macros"] = {["cherry.macros"] = true}, autoload = {nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local nvim = _local_0_[1]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.colors"
do local _ = ({nil, _0_, nil, {{nil}, nil, nil, nil}})[2] end
local colorscheme_fixes
do
  local v_0_
  do
    local v_0_0
    local function colorscheme_fixes0()
      nvim.ex.hi("SpellBad", "gui=underline")
      nvim.ex.hi("SpellLocal", "gui=underline")
      return nvim.ex.hi("SpellRare", "gui=underline")
    end
    v_0_0 = colorscheme_fixes0
    _0_["colorscheme-fixes"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["colorscheme-fixes"] = v_0_
  colorscheme_fixes = v_0_
end
do
  nvim.ex.augroup("srcery_colorscheme_fixes")
  nvim.ex.autocmd_()
  do
    nvim.ex.autocmd("ColorScheme", "srcery", ("lua require('" .. _2amodule_name_2a .. "')['" .. "colorscheme-fixes" .. "']()"))
  end
  nvim.ex.augroup("END")
end
return nvim.ex.colorscheme("srcery")