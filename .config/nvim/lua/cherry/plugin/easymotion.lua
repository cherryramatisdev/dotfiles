local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/easymotion.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.easymotion"
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
    return {autoload("lightspeed"), autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {lightspeed = "lightspeed", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local lightspeed = _local_0_[1]
local nvim = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.easymotion"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
return lightspeed.setup({full_inclusive_prefix_key = "<c-x>", grey_out_search_area = true, highlight_unique_chars = false, jump_on_partial_input_safety_timeout = 400, jump_to_first_match = true, limit_ft_matches = 5, match_only_the_start_of_same_char_seqs = true})