vim.keymap.set(
  "n",
  "<leader><leader>x",
  function()
    vim.cmd [[ silent! write ]]
    local sourcelua = ":luafile " .. vim.fn.expand("%")
    vim.cmd(sourcelua)
  end
)
