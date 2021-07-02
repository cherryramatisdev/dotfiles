local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/harpoon.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.harpoon"
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
    return {autoload("harpoon"), autoload("aniseed.nvim")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {harpoon = "harpoon", nvim = "aniseed.nvim"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local harpoon = _local_0_[1]
local nvim = _local_0_[2]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.harpoon"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
harpoon.setup({})
nvim.set_keymap("n", "<leader>a", ":lua require('harpoon.mark').add_file()<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>e", ":lua require('harpoon.ui').toggle_quick_menu()<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>1", ":lua require('harpoon.term').gotoTerminal(1)<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>2", ":lua require('harpoon.term').gotoTerminal(2)<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>3", ":lua require('harpoon.term').gotoTerminal(3)<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>4", ":lua require('harpoon.term').gotoTerminal(4)<CR>", {noremap = true})
return nvim.set_keymap("n", "<leader>5", ":lua require('harpoon.term').gotoTerminal(5)<CR>", {noremap = true})