(module dotfiles.plugin.fugitive
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>g ":G<CR>" {:noremap true})
