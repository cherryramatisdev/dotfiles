(module dotfiles.mappings
  {autoload {nvim aniseed.nvim
             utils dotfiles.utils}})

(nvim.set_keymap :n :Y :y$ {:noremap true})

(utils.map->normal :<C-h> "vertical resize -4")
(utils.map->normal :<C-j> "resize -4")
(utils.map->normal :<C-k> "resize +4")
(utils.map->normal :<C-l> "vertical resize +4")

;; Maintain it centered
(nvim.set_keymap :n :n :nzzzv {:noremap true})
(nvim.set_keymap :n :N :Nzzzv {:noremap true})
(nvim.set_keymap :n :J "mzJ`z" {:noremap true})
