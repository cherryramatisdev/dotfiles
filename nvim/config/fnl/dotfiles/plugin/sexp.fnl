(module dotfiles.plugin.sexp
  {autoload {nvim aniseed.nvim
             util dotfiles.util}})

(set nvim.g.sexp_filetypes "clojure,scheme,lisp,timl,fennel,janet")

(util.load-plugin :vim-sexp)
(util.load-plugin :vim-sexp-mappings-for-regular-people)
