(module dotfiles.cherry.formatter
  {autoload {nvim aniseed.nvim}})

(defn format []
  "Run the available linter for current filetype"
  (nvim.o.filetype))
