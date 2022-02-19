vim.keymap.set(
  "n",
  "<leader>f",
  function()
    require("telescope.builtin").find_files()
  end
)

vim.keymap.set(
  "n",
  "<leader>l",
  function()
    require("telescope.builtin").live_grep()
  end
)

vim.keymap.set(
  "n",
  "<leader>e",
  function()
    require("telescope").extensions.file_browser.file_browser()
  end
)
