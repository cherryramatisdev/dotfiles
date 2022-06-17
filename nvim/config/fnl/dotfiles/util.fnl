(module dotfiles.util
  {require {nvim aniseed.nvim}})

(defn load-plugin [plugin]
  "Given an plugin name, load it with packadd"
  (vim.cmd (.. "packadd " plugin)))
