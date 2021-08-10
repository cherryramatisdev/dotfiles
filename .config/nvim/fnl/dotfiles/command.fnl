(module dotfiles.command 
  {autoload {nvim aniseed.nvim
             str aniseed.string
             a aniseed.core}})

(nvim.command "command! Wiki VimwikiIndex")

(defn insert_date_stamp []
  (let [date (vim.fn.system "date +%F")
        oneline_date (a.get (str.split date "\n") 1)]
    (vim.cmd (string.format "normal! a %s" oneline_date))))

(nvim.command "command! DS :lua require'dotfiles.command'.insert_date_stamp()")
