(module cherry.plugin.git
  {autoload {nvim aniseed.nvim
             neogit neogit}})

(neogit.setup {})

(nvim.set_keymap :n :<leader>g ":Neogit<CR>" {:noremap true})
