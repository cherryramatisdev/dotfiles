local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/telescope.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.telescope"
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
    return {autoload("telescope.actions"), autoload("telescope.builtin"), autoload("aniseed.nvim"), autoload("telescope")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {actions = "telescope.actions", builtin = "telescope.builtin", nvim = "aniseed.nvim", tele = "telescope"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local actions = _local_0_[1]
local builtin = _local_0_[2]
local nvim = _local_0_[3]
local tele = _local_0_[4]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.telescope"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
tele.setup({defaults = {find_command = {"rg", "--no-heading", "--with-filename", "--line-number", "--column", "--smart-case"}, mappings = {i = {["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous, ["<Esc>"] = actions.close}, n = {["<C-j>"] = actions.move_selection_next, ["<C-k>"] = actions.move_selection_previous, ["<Esc>"] = actions.close}}}})
local search_dotfiles
do
  local v_0_
  do
    local v_0_0
    local function search_dotfiles0()
      return builtin.find_files({cwd = "$HOME/Documents/dotfiles/.config/", prompt_title = "< VimRC >"})
    end
    v_0_0 = search_dotfiles0
    _0_["search_dotfiles"] = v_0_0
    v_0_ = v_0_0
  end
  local t_0_ = (_0_)["aniseed/locals"]
  t_0_["search_dotfiles"] = v_0_
  search_dotfiles = v_0_
end
nvim.set_keymap("n", "<leader><space>", ":Telescope find_files<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>bb", ":Telescope buffers<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>.", ":Telescope file_browser<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>ps", ":Telescope file_browser<CR>", {noremap = true})
return nvim.set_keymap("n", "<leader>vrc", ":lua require('cherry.plugin.telescope').search_dotfiles()<CR>", {noremap = true})