(module dotfiles.init
  {require {util dotfiles.util}})

(require :dotfiles.core)
(require :dotfiles.statusline)

(util.load-plugin :vim-commentary)
(util.load-plugin :vim-surround)
(util.load-plugin :vim-vinegar)
(util.load-plugin :vim-dispatch)
(util.load-plugin :vim-jack-in)

(defn plugin-config-require [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(plugin-config-require :treesitter)
(plugin-config-require :sexp)
(plugin-config-require :colorscheme)
(plugin-config-require :completion)
