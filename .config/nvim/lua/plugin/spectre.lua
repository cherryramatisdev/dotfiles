local ok, pkg = pcall(require, "spectre")

if not ok then
  return
end

pkg.setup()
vim.keymap.nnoremap("<leader>S", [[:lua require("spectre").open()<CR>]])
