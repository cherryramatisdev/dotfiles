vim.opt.spell = true
vim.opt.spelllang = { "en_us" }

local cmp = require "cmp"

cmp.setup.buffer {
  sources = {
    { name = "spell" },
    { name = "snippy" },
    {
      name = "buffer",
      opts = {
        get_bufnrs = function()
          return vim.api.nvim_list_bufs()
        end,
      },
    },
    { name = "path" },
  },
  experimental = {
    ghost_text = false,
  },
}
