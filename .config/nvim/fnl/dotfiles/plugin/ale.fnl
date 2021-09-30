(module dotfiles.plugin.ale
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>ca ":ALECodeAction<CR>" { :noremap true })
(nvim.set_keymap :n :<leader>co ":ALEOrganizeImports<CR>" { :noremap true })
(nvim.set_keymap :n :K ":ALEHover<CR>" { :noremap true })
(nvim.set_keymap :n :gd ":ALEGoToDefinition<CR>" { :noremap true })
