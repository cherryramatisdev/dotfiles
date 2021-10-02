(module dotfiles.plugin.ranger
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>e ":RnvimrToggle<cr>" {:noremap true})
