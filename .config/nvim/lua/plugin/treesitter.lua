local ok, ts = pcall(require, 'nvim-treesitter.configs')

if not ok then
	return
end

ts.setup({
	ensure_installed = "maintained",
	highlight = {
		enable = true
	}
})
