return require "packer".startup(
  function()
    use "wbthomason/packer.nvim"

    use {
      "navarasu/onedark.nvim",
      config = function()
        require("onedark").setup {
          style = "darker"
        }
        require("onedark").load()
      end
    }

    use "nvim-lua/plenary.nvim"
    use "tjdevries/express_line.nvim"

    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/plenary.nvim"}}
    }
    use "nvim-telescope/telescope-file-browser.nvim"

    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    use "mhartington/formatter.nvim"

    use "neovim/nvim-lspconfig"
    use "kyazdani42/nvim-web-devicons"
    use "onsails/lspkind-nvim"

    use "fatih/vim-go"

    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-nvim-lua"
    use "hrsh7th/cmp-buffer"
    use "hrsh7th/cmp-path"
    use "hrsh7th/cmp-cmdline"
    use "hrsh7th/nvim-cmp"

    use "L3MON4D3/LuaSnip"
    use "saadparwaiz1/cmp_luasnip"

    use "numToStr/Comment.nvim"

    use "windwp/nvim-autopairs"

    use "voldikss/vim-floaterm"

    use "nvim-orgmode/orgmode"
    --
    -- use {
    --   "pwnkeymapr/octo.nvim",
    --   requires = {
    --     "nvim-lua/plenary.nvim",
    --     "nvim-telescope/telescope.nvim",
    --     "kyazdani42/nvim-web-devicons"
    --   },
    --   config = function()
    --     require "octo".setup()
    --   end
    -- }

    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
    }
    use "janko-m/vim-test"
    use "pbrisbin/vim-mkdir"

    use "tpope/vim-endwise"
    use "tpope/vim-eunuch"
    use "tpope/vim-fugitive"
    use "tpope/vim-repeat"
    use "tpope/vim-rhubarb"

    use "tpope/vim-vinegar"
    use "tpope/vim-rsi"
    use "tpope/vim-projectionist"
    use "tpope/vim-haystack"
    use "tpope/vim-surround"
    -- find, replace with odd plurals and caps, eg ":%S/dog{,s}/child{,ren}/g"
    use "tpope/vim-abolish"

    -- text stuff
    use "kana/vim-textobj-user"
    use "bkad/CamelCaseMotion"
    -- Adds 'il' and 'al'
    use "kana/vim-textobj-line"

    -- auto-apply editorconfig settings on save
    use "editorconfig/editorconfig-vim"

    -- code expansion via shortcuts
    use "mattn/emmet-vim"

    -- nerdtree file tree
    use "scrooloose/nerdtree"
    use "Xuyuanp/nerdtree-git-plugin"

    -- markdown/zen writing
    use "reedes/vim-pencil"
    use "junegunn/goyo.vim"
    use "M4R7iNP/vim-inky"

    -- gS and gJ to switch between single and multi-line
    use "AndrewRadev/splitjoin.vim"
    use "AndrewRadev/andrews_nerdtree.vim"
    use "AndrewRadev/writable_search.vim"

    -- tmux integration
    use "benmills/vimux"
    use "christoomey/vim-tmux-navigator"

    -- markdown
    use {"ellisonleao/glow.nvim"}
  end
)
