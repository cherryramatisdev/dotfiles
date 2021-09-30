(module dotfiles.cherry.file-management
  {autoload {nvim aniseed.nvim}})

;; TODO: name this properly
;; TODO: make this nvim_exec work
(defn- my/delete []
  (vim.api.nvim_command (string.format "silent ! rm -rf %s/%s" (nvim.fn.expand "%") (nvim.fn.getline ".")))
  (vim.api.nvim_exec "normal \\<C-l>" true))

;; TODO: name this properly
;; TODO: make this nvim_exec work
(defn- my/delete2 []
  (vim.api.nvim_command (string.format "silent ! rm -rf %s" (nvim.fn.getline ".")))
  (vim.api.nvim_exec "normal \\<C-l>" true))

(defn delete_file []
  "Delete the target file on current line"
  (let [should_delete (nvim.fn.confirm "Are you sure that want to delete?" "&Yes\n&No" 1)]
    (if (= should_delete 1)
      (if (> (nvim.fn.len "%") 0)
        (my/delete)
        (my/delete2)))))
