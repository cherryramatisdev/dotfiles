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
     :neovim/nvim-lspconfig {:mod :lsp}
     :glepnir/lspsaga.nvim {:mod :lsp}
     :Olical/vim-enmasse {}
     :wbthomason/packer.nvim {}
     :JoosepAlviste/nvim-ts-context-commentstring {}
     :windwp/nvim-ts-autotag {}
     :nvim-treesitter/nvim-treesitter {:run ":TSUpdate" :mod :treesitter}
     :srcery-colors/srcery-vim {:mod :colors}
     :tami5/compe-conjure {}
     :hrsh7th/nvim-compe {:mod :compe}
     :kristijanhusak/orgmode.nvim {:mod :org}
     :kyazdani42/nvim-web-devicons {}
     :nvim-lua/popup.nvim {}
     :nvim-lua/plenary.nvim {}
     :nvim-telescope/telescope.nvim {:mod :telescope}
     :tpope/vim-commentary {}
     :windwp/nvim-autopairs {:mod :autopairs}
     :tpope/vim-surround {}
     :tpope/vim-vinegar {}
     :itchyny/vim-gitbranch {}
     :TimUntersberger/neogit {:mod :git}
     :itchyny/lightline.vim {:mod :statusline}
     :ThePrimeagen/harpoon {:mod :harpoon}
     :mhartington/formatter.nvim {:mod :format}
     :tpope/vim-dispatch {}
     :radenling/vim-dispatch-neovim {}
     :clojure-vim/vim-jack-in {}
     :guns/vim-sexp {:mod :sexp}
     :tpope/vim-sexp-mappings-for-regular-people {}
     :ggandor/lightspeed.nvim {:mod :easymotion}
     :SirVer/ultisnips {:mod :snippets}
     :honza/vim-snippets {}
     )
