-- Remaps for each of the four debug operations currently offered by the plugin
vim.api.nvim_buf_set_keymap(
  0,
  "v",
  "<Leader>re",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function')<CR>]],
  {noremap = true, silent = true, expr = false}
)
vim.api.nvim_buf_set_keymap(
  0,
  "v",
  "<Leader>rf",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Function To File')<CR>]],
  {noremap = true, silent = true, expr = false}
)
vim.api.nvim_buf_set_keymap(
  0,
  "v",
  "<Leader>rv",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Extract Variable')<CR>]],
  {noremap = true, silent = true, expr = false}
)
vim.api.nvim_buf_set_keymap(
  0,
  "v",
  "<Leader>ri",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  {noremap = true, silent = true, expr = false}
)
vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<Leader>ri",
  [[ <Esc><Cmd>lua require('refactoring').refactor('Inline Variable')<CR>]],
  {noremap = true, silent = true, expr = false}
)

vim.api.nvim_buf_set_keymap(
  0,
  "n",
  "<leader>rp",
  ":lua require('refactoring').debug.printf({below = true})<CR>",
  {noremap = true}
)

-- Print var: this remap should be made in visual mode
vim.api.nvim_buf_set_keymap(
  0,
  "v",
  "<leader>rV",
  ":lua require('refactoring').debug.print_var({})<CR>",
  {noremap = true}
)

-- Cleanup function: this remap should be made in normal mode
vim.api.nvim_buf_set_keymap(0, "n", "<leader>rc", ":lua require('refactoring').debug.cleanup({})<CR>", {noremap = true})
