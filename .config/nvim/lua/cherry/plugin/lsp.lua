local _2afile_2a = "/home/cherry/.config/nvim/fnl/cherry/plugin/lsp.fnl"
local _0_
do
  local name_0_ = "cherry.plugin.lsp"
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
    return {autoload("lspconfig"), autoload("aniseed.nvim"), autoload("lspsaga")}
  end
  ok_3f_0_, val_0_ = pcall(_2_)
  if ok_3f_0_ then
    _0_["aniseed/local-fns"] = {autoload = {lsp = "lspconfig", nvim = "aniseed.nvim", saga = "lspsaga"}}
    return val_0_
  else
    return print(val_0_)
  end
end
local _local_0_ = _2_(...)
local lsp = _local_0_[1]
local nvim = _local_0_[2]
local saga = _local_0_[3]
local _2amodule_2a = _0_
local _2amodule_name_2a = "cherry.plugin.lsp"
do local _ = ({nil, _0_, nil, {{}, nil, nil, nil}})[2] end
lsp.tsserver.setup({})
nvim.set_keymap("n", "gH", "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>", {noremap = true})
nvim.set_keymap("n", "ga", "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>", {noremap = true})
nvim.set_keymap("v", "ga", ":<C-U>lua require'lspsaga.codeaction'.range_code_action()<CR>", {noremap = true})
nvim.set_keymap("n", "K", "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>", {noremap = true})
nvim.set_keymap("n", "gs", "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>", {noremap = true})
nvim.set_keymap("n", "rn", "<cmd>lua require'lspsaga.rename'.rename()<CR>", {noremap = true})
nvim.set_keymap("n", "<leader>cd", "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>", {noremap = true})
return nvim.set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definitio()<CR>", {noremap = true})