---@diagnostic disable: undefined-global
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(
  function()
    -- Libs and must haves for nvim and lua development
    use "wbthomason/packer.nvim"
    use {"nvim-lua/plenary.nvim", requires = {"nvim-lua/popup.nvim"}}
    use "norcalli/nvim_utils"
    use "tjdevries/nlua.nvim"
    use "euclidianAce/BetterLua.vim"
    use "tjdevries/manillua.nvim"

    -- Tpope plugins
    use {"tpope/vim-dispatch", cmd = {"Dispatch", "Make", "Focus", "Start"}}
    -- use "tpope/vim-vinegar"
    use "tpope/vim-fugitive"
    use "tpope/vim-surround"
    use "tpope/vim-sleuth"
    use "tpope/vim-repeat"
    use "tpope/vim-rhubarb"
    use "shumphrey/fugitive-gitlab.vim"
    use "tpope/vim-rsi"
    use "tpope/vim-capslock"
    use {"tpope/vim-commentary", requires = {{'JoosepAlviste/nvim-ts-context-commentstring'}}}

    -- Kana plugins
    use "kana/vim-textobj-user"
    use "kana/vim-textobj-entire"
    use "kana/vim-textobj-line"

    -- Multiple cursors
    use {"mg979/vim-visual-multi", branch = "master"}

    -- Org mode support
    use "dhruvasagar/vim-dotoo"

    -- UI helper(for italicize things)
    use "wincent/pinnacle"

    -- Auto pairs, must have
    use {"windwp/nvim-autopairs", config = function()
      require("cherry.autopairs")
    end}

    -- Replace from register using `gr`
    use "vim-scripts/ReplaceWithRegister"

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate", config = function()
      require('cherry.treesitter')
    end}
    use "windwp/nvim-ts-autotag"

    -- Lsp setup and completion
    use {
      "hrsh7th/nvim-compe",
      config = function()
        require("cherry.completion")
      end
    }
    use {
      "neovim/nvim-lspconfig",
      requires = {"kabouzeid/nvim-lspinstall", "glepnir/lspsaga.nvim"},
      config = function()
        require("cherry.lsp")
      end
    }

    -- better highglight with lsp
    use "folke/lsp-colors.nvim"

    -- Display diagnostics better
    use {
      "folke/trouble.nvim",
      requires = "kyazdani42/nvim-web-devicons",
      config = function()
        require("trouble").setup {}
      end
    }

    -- Colorscheme
    use {"npxbr/gruvbox.nvim", requires = {"rktjmp/lush.nvim"}}

    -- Fuzzy finder
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("cherry.fuzzy")
      end
    }

    -- Open stuff quickly
    use {
      "ThePrimeagen/harpoon",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}},
      config = function()
        require("cherry.harpoon")
      end
    }

    -- Formatter
    use {
      "mhartington/formatter.nvim",
      config = function()
        require("cherry.formatter")
      end
    }

    -- Norcalli plugins
    -- use {
    --   "norcalli/snippets.nvim",
    --   config = function()
    --     require("cherry.snips")
    --   end
    -- }
    use {
      "SirVer/ultisnips",
      requires = {{"honza/vim-snippets"}},
      config = function()
        require("cherry.snips")
      end
    }

    use {
      "norcalli/nvim-colorizer.lua",
      config = function()
        require("colorizer").setup()
      end
    }

    -- handle focus when using splits
    -- use "TaDaa/vimade"

    -- File Browser
    use {
      "kyazdani42/nvim-tree.lua",
      requires = {"kyazdani42/nvim-web-devicons"},
      config = function()
        require("cherry.filebrowser")
      end
    }

    -- Test runner
    use {
      "vim-test/vim-test",
      config = function()
        require('cherry.testrunner')
      end
    }
  end
)
