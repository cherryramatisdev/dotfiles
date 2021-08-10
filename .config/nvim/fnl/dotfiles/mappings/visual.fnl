(module dotfiles.plugin.visual
  {autoload {nvim aniseed.nvim}})

(defn- map [from to]
  (nvim.set_keymap :v from to {:noremap true}))

;; Moving text
(map :J ":m '>+1<CR>gv=gv")
(map :K ":m '<-2<CR>gv=gv")
