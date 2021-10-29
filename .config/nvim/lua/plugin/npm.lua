local ok, pkg = pcall(require, "package-info")

if not ok then
  return
end

pkg.setup()

local nnoremap = vim.keymap.nnoremap

-- Show package versions
nnoremap {
  "<leader>ns",
  function()
    require("package-info").show()
  end,
}

-- Hide package versions
nnoremap {
  "<leader>nc",
  function()
    require("package-info").hide()
  end,
}

-- Update package on line
nnoremap {
  "<leader>nu",
  function()
    require("package-info").update()
  end,
}

-- Delete package on line
nnoremap {
  "<leader>nd",
  function()
    require("package-info").delete()
  end,
}

-- Install a new package
nnoremap {
  "<leader>ni",
  function()
    require("package-info").install()
  end,
}

-- Reinstall dependencies
nnoremap {
  "<leader>nr",
  function()
    require("package-info").reinstall()
  end,
}

-- Install a different package version
nnoremap {
  "<leader>np",
  function()
    require("package-info").change_version()
  end,
}
