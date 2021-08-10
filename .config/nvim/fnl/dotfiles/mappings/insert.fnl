(module dotfiles.mappings.insert
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :i :<C-j> :<C-n> {:noremap true})
(nvim.set_keymap :i :<C-k> :<C-p> {:noremap true})

;; Undo break points
(nvim.set_keymap :i "," ",<c-g>u" {:noremap true})
(nvim.set_keymap :i "." ".<c-g>u" {:noremap true})
(nvim.set_keymap :i "!" "!<c-g>u" {:noremap true})
(nvim.set_keymap :i "?" "?<c-g>u" {:noremap true})
