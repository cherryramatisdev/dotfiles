local nnoremap = vim.keymap.nnoremap

require("harpoon").setup {
  nav_first_in_list = true,
  projects = {
    ["/home/cherry/projects/work/pantheon"] = {
      term = {
        cmds = {
          "yarn storybook",
        },
      },
    },
  },
}

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

nnoremap {
  "<leader>1",
  function()
    require("harpoon.term").gotoTerminal(1)
  end,
}

nnoremap {
  "<leader>2",
  function()
    require("harpoon.term").gotoTerminal(2)
  end,
}

nnoremap {
  "<leader>3",
  function()
    require("harpoon.term").gotoTerminal(3)
  end,
}

nnoremap {
  "<leader>4",
  function()
    require("harpoon.term").gotoTerminal(4)
  end,
}

nnoremap {
  "<leader>5",
  function()
    require("harpoon.term").gotoTerminal(5)
  end,
}

nnoremap {
  "<leader>6",
  function()
    require("harpoon.term").gotoTerminal(6)
  end,
}
