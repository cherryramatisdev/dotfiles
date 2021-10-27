local ok, ts = pcall(require, "nvim-treesitter.configs")

if not ok then
  return
end

ts.setup {
  ensure_installed = { "lua", "tsx", "css", "typescript", "javascript", "jsdoc", "ruby", "go" },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
}
