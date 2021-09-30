(module dotfiles.general.keybindings
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>w ":w<cr>" {:noremap true})
(nvim.set_keymap :n :<leader>q "ZZ" {:noremap true})
