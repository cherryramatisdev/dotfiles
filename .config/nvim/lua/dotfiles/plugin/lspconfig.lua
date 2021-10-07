local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/plugin/lspconfig.fnl"
local _2amodule_name_2a = "dotfiles.plugin.lspconfig"
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
local lsp = require("lspconfig")
local linstall = require("lspinstall")
linstall.setup()
lsp.tsserver.setup({})
lsp.go.setup({})
nvim.set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", {noremap = true})
nvim.set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", {noremap = true})
nvim.set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", {noremap = true})
nvim.set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", {noremap = true})
nvim.set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", {noremap = true})
nvim.set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>", {noremap = true})
nvim.set_keymap("n", "<space>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", {noremap = true})
nvim.set_keymap("n", "<space>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", {noremap = true})
nvim.set_keymap("n", "<space>lf", "<cmd>lua vim.lsp.buf.formatting()<CR>", {noremap = true})
nvim.set_keymap("n", "<space>e", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", {noremap = true})
nvim.set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", {noremap = true})
nvim.set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", {noremap = true})
return nvim.set_keymap("n", "<space>Q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", {noremap = true})