(module dotfiles.utils
  {autoload {nvim aniseed.nvim
             a aniseed.core}})

(defn map->leader [from to]
  "Set nnoremap using leader"
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (nvim.set_keymap :n (string.format "<leader>%s" from) to map-opts)))

(defn map->normal [from to opts]
  (let [map-opts {:noremap true}
        to (.. ":" to "<cr>")]
    (if (a.get opts :local?)
      (nvim.buf_set_keymap 0 :n from to map-opts)
      (nvim.set_keymap :n from to map-opts))))
