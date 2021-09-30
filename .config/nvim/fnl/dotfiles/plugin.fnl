(module dotfiles.plugin
  {autoload {nvim aniseed.nvim
             a aniseed.core
             packer packer}})

(defn safe-require-plugin-config [name]
  (let [(ok? val-or-err) (pcall require (.. :dotfiles.plugin. name))]
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
  :cherryramatisdev/semantical-commits.vim {}
  :Olical/AnsiEsc {}
  :Olical/aniseed {:branch :develop}
  :Olical/conjure {:branch :develop :mod :conjure}
  :Olical/nvim-local-fennel {}
  :Olical/vim-enmasse {}
  :beauwilliams/statusline.lua {:mod :statusline}
  :kyazdani42/nvim-web-devicons {}
  :folke/tokyonight.nvim {:mod :color}
  :inkarkat/vim-ReplaceWithRegister {}
  :christoomey/vim-titlecase {}
  :kana/vim-textobj-user {}
  :kana/vim-textobj-line {}
  :kana/vim-textobj-function {}
  :kana/vim-textobj-entire {}
  :tpope/vim-fugitive {:mod :fugitive}
  :tpope/vim-sensible {}
  :tpope/vim-sleuth {}
  :tpope/vim-repeat {}
  :tpope/vim-unimpaired {}
  :tpope/vim-surround {}
  :tpope/vim-vinegar {}
  :tpope/vim-obsession {}
  :tpope/vim-commentary {}
  :tpope/vim-rsi {}
  :tpope/vim-scriptease {}
  :tpope/vim-eunuch {}
  :tpope/vim-characterize {}
  :tpope/vim-markdown {}
  :tpope/vim-endwise {}

  :AndrewRadev/tagalong.vim {}
  :AndrewRadev/ginitpull.vim {}

  :dhruvasagar/vim-open-url {}
  :dhruvasagar/vim-zoom {}

  :fatih/vim-go {}
  :mattn/emmet-vim {}

  :SirVer/ultisnips {}
  :honza/vim-snippets {}

  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}

  :folke/todo-comments.nvim {:mod :todo :requires [[:nvim-lua/plenary.nvim]]}
  :folke/which-key.nvim {:mod :which-key}

  :tweekmonster/startuptime.vim {}
  :dense-analysis/ale {:mod :ale}
  :wbthomason/packer.nvim {}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}

  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :ahmedkhalf/project.nvim {:mod :project}
  )
