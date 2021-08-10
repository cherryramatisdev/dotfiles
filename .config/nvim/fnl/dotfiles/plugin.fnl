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

(use
  :wbthomason/packer.nvim {}
  :Olical/aniseed {:branch :develop}
  :Olical/conjure {:branch :develop :mod :conjure}
  :owickstrom/vim-colors-paramount {:mod :colors}
  :marko-cerovac/material.nvim {:mod :colors}
  :tpope/vim-commentary {}
  :tpope/vim-surround {}
  :tpope/vim-fugitive {}
  :tpope/vim-rsi {}
  :tpope/vim-sensible {}
  :tpope/vim-vinegar {}
  :tpope/vim-repeat {}
  :tpope/vim-speeddating {}
  :tpope/vim-markdown {:mod :markdown}
  :guns/vim-sexp {:mod :sexp}
  :tpope/vim-sexp-mappings-for-regular-people {}
  :glepnir/lspsaga.nvim {}
  :neovim/nvim-lspconfig {:mod :lsp}
  :hrsh7th/nvim-compe {:mod :compe}
  :tami5/compe-conjure {}
  :hrsh7th/vim-vsnip {:mod :snippets}
  :hrsh7th/vim-vsnip-integ {}
  :nvim-treesitter/nvim-treesitter {:mod :treesitter}
  :nvim-lua/popup.nvim {}
  :nvim-lua/plenary.nvim {}
  :nvim-telescope/telescope.nvim {:mod :telescope}
  :mhartington/formatter.nvim {:mod :formatter}
  :vim-test/vim-test {}
  :togglebyte/togglerust {}
  :kdheepak/lazygit.nvim {}
  :vimwiki/vimwiki {:mod :wiki}
  :kristijanhusak/orgmode.nvim {:mod :org}
  )
