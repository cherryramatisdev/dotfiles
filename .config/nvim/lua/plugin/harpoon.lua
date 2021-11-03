local nnoremap = vim.keymap.nnoremap

nnoremap {
  "<leader>a",
  function()
    require("harpoon.mark").add_file()
  end,
}

nnoremap {
  "<leader>e",
  function()
    require("harpoon.ui").toggle_quick_menu()
  end,
}

nnoremap {
  "<C-h>",
  function()
    require("harpoon.ui").nav_file(1)
  end,
}

nnoremap {
  "<C-j>",
  function()
    require("harpoon.ui").nav_file(2)
  end,
}

nnoremap {
  "<C-k>",
  function()
    require("harpoon.ui").nav_file(3)
  end,
}

nnoremap {
  "<C-l>",
  function()
    require("harpoon.ui").nav_file(4)
  end,
}
