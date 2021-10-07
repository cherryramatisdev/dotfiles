(module dotfiles.plugin.filebrowser
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :n :<leader>e ":Vifm<cr>" {:noremap true})
