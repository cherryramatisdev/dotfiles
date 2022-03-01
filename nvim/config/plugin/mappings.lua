vim.keymap.set(
  "n",
  "<leader><leader>x",
  function()
    vim.cmd [[ silent! write ]]
    local sourcelua = ":luafile " .. vim.fn.expand("%")
    vim.cmd(sourcelua)
  end
)

vim.keymap.set("n", "<Tab>", "gt")
vim.keymap.set("n", "<S-Tab>", "gT")
vim.keymap.set("n", "te", ":tabnew<cr>")
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.keymap.set("n", "gt", ":FloatermToggle<cr>")

vim.keymap.set("t", "<C-[>", [[<C-\><C-n>]])
vim.keymap.set("t", "<C-d>", [[<C-\><C-n>:bd!<cr>]])

vim.keymap.set(
  "n",
  "<leader><CR>",
  function()
    local cmd = vim.fn.input("Run: ")

    -- TODO: improve this
    if cmd == "back" then
      vim.cmd [[ sp | terminal yarn start:dev ]]
      return
    end

    -- TODO: improve this
    if cmd == "front" then
      vim.cmd [[ sp | terminal yarn dev ]]
      return
    end

    vim.cmd("sp | terminal " .. cmd)
  end
)

vim.keymap.set("n", "<A-h>", ":vertical resize -5<cr>")
vim.keymap.set("n", "<A-l>", ":vertical resize +5<cr>")
vim.keymap.set("n", "<A-j>", ":resize -5<cr>")
vim.keymap.set("n", "<A-k>", ":resize +5<cr>")
