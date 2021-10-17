local ok, pkg = pcall(require, "neogit")

if not ok then
  return
end

pkg.setup()

vim.api.nvim_set_keymap("n", "<leader>g", ":Neogit<cr>", { noremap = true })
