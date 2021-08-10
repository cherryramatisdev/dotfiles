(module dotfiles.mappings.command
  {autoload {nvim aniseed.nvim}})

;; edit command
(nvim.set_keymap :c :%% "<C-R>=fnameescape(expand('%:h')).'/'<cr>" {:noremap true})
