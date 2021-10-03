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
  :kabouzeid/nvim-lspinstall {}
  :neovim/nvim-lspconfig {:mod :lsp}
  :hrsh7th/nvim-compe {:mod :completion}
  :SirVer/ultisnips {:mod :snippets}
  :honza/vim-snippets {}
  :prettier/vim-prettier {:mod :prettier}
  :tami5/compe-conjure {}
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
  :tpope/vim-dispatch {}
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

  :AndrewRadev/tagalong.vim {}
  :AndrewRadev/ginitpull.vim {}

  :dhruvasagar/vim-open-url {}
  :dhruvasagar/vim-zoom {}

  :fatih/vim-go {}
  :mattn/emmet-vim {}

  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}

  :folke/lsp-colors.nvim {}
  :folke/trouble.nvim {:mod :trouble :requires [[:kyazdani42/nvim-web-devicons ]]}
  :folke/todo-comments.nvim {:mod :todo :requires [[:nvim-lua/plenary.nvim]]}
  :folke/which-key.nvim {:mod :which-key}

  :tweekmonster/startuptime.vim {}
  :wbthomason/packer.nvim {}
  :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}

  :nvim-telescope/telescope.nvim {:mod :telescope :requires [[:nvim-lua/popup.nvim] [:nvim-lua/plenary.nvim]]}
  :kdheepak/lazygit.nvim {:mod :lazygit}
  :kevinhwang91/rnvimr {:mod :ranger}
  :akinsho/toggleterm.nvim {:mod :terminal}
  :ahmedkhalf/project.nvim {:mod :project}
  :clojure-vim/vim-jack-in {}
  )
