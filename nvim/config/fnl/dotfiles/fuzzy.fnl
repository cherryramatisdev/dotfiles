(module dotfiles.fuzzy
  {require {nvim aniseed.nvim}})

(defn- return-cmd []
  (if (nvim.fn.stridx (nvim.fn.system "git status") "not in")
    "fd . -t f"
    "git ls-files"))

(defn files_picker [a l p]
  (let [cmd (return-cmd)
        items (nvim.fn.systemlist cmd)]
    (if (> (length a) 0)
      (nvim.fn.matchfuzzy items a)
      items)))

(defn files_edit [direction args]
  (nvim.fn.execute (.. direction " " args)))

(vim.api.nvim_create_user_command "E" (fn [tbl] (files_edit "e" tbl.args)) { :nargs 1 :bar true :complete files_picker})
(vim.api.nvim_create_user_command "S" (fn [tbl] (files_edit "sp" tbl.args)) { :nargs 1 :bar true :complete files_picker})
(vim.api.nvim_create_user_command "V" (fn [tbl] (files_edit "vs" tbl.args)) { :nargs 1 :bar true :complete files_picker})
(vim.api.nvim_create_user_command "T" (fn [tbl] (files_edit "tabe" tbl.args)) { :nargs 1 :bar true :complete files_picker})
