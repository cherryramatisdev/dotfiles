(module cherry.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :cherry.plugin. name))]
    (when (not ok?)
      (print (.. "dotfiles error: " val-or-err)))))

(defn- use [...]
  "Iterates through the arguments as pairs and calls packer's use function for
  each of them. Works around Fennel not liking mixed associative and sequential
  tables as well."
  (let [pkgs [...]]
    (packer.startup
      (fn [use]
        (for [i 1 (a.count pkgs) 2]
          (let [name (. pkgs i)
                opts (. pkgs (+ i 1))]
            (-?> (. opts :mod) (safe-require-plugin-config))
            (use (a.assoc opts 1 name))))))))

;; Plugins to be managed by packer.
(use
     :Olical/AnsiEsc {}
     :Olical/aniseed {:branch :develop}
     :Olical/conjure {:branch :develop :mod :conjure}
     :Olical/vim-enmasse {}
     :wbthomason/packer.nvim {}
     :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}
     :srcery-colors/srcery-vim {:mod :colors}
     :hrsh7th/nvim-compe {:mod :compe}
     :kristijanhusak/orgmode.nvim {:mod :org}
     )
