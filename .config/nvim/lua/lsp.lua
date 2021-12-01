---@diagnostic disable: undefined-global
local lsp_installer = require("nvim-lsp-installer")
local coq = require("coq")

lsp_installer.on_server_ready(function(server)
	local opts = {}

	vim.api.nvim_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	server:setup(coq.lsp_ensure_capabilities(opts))
end)
