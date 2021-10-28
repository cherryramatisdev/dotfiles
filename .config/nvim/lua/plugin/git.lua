local ok, pkg = pcall(require, "neogit")

if not ok then
  return
end

pkg.setup()

vim.keymap.nnoremap { "<leader>g", [[:Neogit<cr>]] }
