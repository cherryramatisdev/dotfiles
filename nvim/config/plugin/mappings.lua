vim.keymap.set("v", "$", "g_")
vim.keymap.set("n", "j", "gj")
vim.keymap.set("n", "k", "gk")

vim.keymap.set("n", "p", "p=`]")
vim.keymap.set("n", "<leader>P", "p")
vim.keymap.set("n", "<leader>p", [["0p]])
vim.keymap.set("n", "<leader><leader>", [[<C-^>]])

vim.keymap.set(
  "n",
  "<leader>x",
  function()
    vim.cmd [[ silent! write ]]
    local sourcelua = ":luafile " .. vim.fn.expand("%")
    vim.cmd(sourcelua)
    print("reloaded " .. vim.fn.expand("%") .. " 🌞")
  end
)

vim.keymap.set("n", "H", "gt")
vim.keymap.set("n", "L", "gT")
vim.keymap.set("n", "<leader>nt", ":tabnew<cr>")
vim.keymap.set("n", "<leader>w", ":w<cr>")
vim.keymap.set("n", "<leader>q", ":q<cr>")
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.keymap.set("n", "<leader>t", ":FloatermToggle<cr>")

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

vim.keymap.set("n", "<Left>", "5<C-w><")
vim.keymap.set("n", "<Right>", "5<C-w>>")
vim.keymap.set("n", "<Down>", "<C-w>-")
vim.keymap.set("n", "<Up>", "<C-w>+")

-- Copy file paths to clipboard
-- Relative path
vim.keymap.set("n", "<leader>cf", ':let @+=expand("%")<CR>')

-- Absolute path
vim.keymap.set("n", "<leader>cF", ':let @+=expand("%:p")<CR>')

-- Filename, without path
vim.keymap.set("n", "<leader>cf", ':let @+=expand("%:t")<CR>')
