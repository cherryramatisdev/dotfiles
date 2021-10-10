return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- coding stuff
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "saadparwaiz1/cmp_luasnip" },
    },
  }
  use { "jose-elias-alvarez/null-ls.nvim", requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" } }
  use "jose-elias-alvarez/nvim-lsp-ts-utils"
  use "kabouzeid/nvim-lspinstall"
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugin.lsp"
    end,
  }

  use "JoosepAlviste/nvim-ts-context-commentstring"
  use {
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require "plugin.treesitter"
    end,
    run = ":TSUpdate",
  }

  -- fuzzy finder
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-telescope/telescope-fzy-native.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-project.nvim" },
    },
    config = function()
      require "plugin.telescope"
    end,
  }

  -- colorscheme
  use {
    "projekt0n/github-nvim-theme",
    config = function()
      require "plugin.colorscheme"
    end,
  }

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    config = function()
      require "plugin.snippets"
    end,
  }

  -- misc
  use {
    "max397574/better-escape.nvim",
    config = function()
      require("better_escape").setup {
        mapping = { "jj" },
        clear_empty_lines = false,
        keys = "<Esc>",
      }
    end,
  }
  use "fatih/vim-go"
  use {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup()
    end,
  }
  use {
    "folke/trouble.nvim",
    config = function()
      require "plugin.trouble"
    end,
    requires = { { "kyazdani42/nvim-web-devicons" }, { "folke/lsp-colors.nvim" } },
  }
  use {
    "folke/todo-comments.nvim",
    config = function()
      require "plugin.todo"
    end,
    requires = { { "nvim-lua/plenary.nvim" } },
  }
  use {
    "folke/which-key.nvim",
    config = function()
      require "plugin.whichkey"
    end,
  }
  use "inkarkat/vim-ReplaceWithRegister"
  use "christoomey/vim-titlecase"
  use "kana/vim-textobj-user"
  use "kana/vim-textobj-line"
  use "kana/vim-textobj-function"
  use "kana/vim-textobj-entire"

  use "AndrewRadev/tagalong.vim"
  use "dhruvasagar/vim-zoom"
  use "tweekmonster/startuptime.vim"
  use {
    "kdheepak/lazygit.nvim",
    config = function()
      require "plugin.git"
    end,
  }
  use {
    "vifm/vifm.vim",
    config = function()
      require "plugin.vifm"
    end,
  }
  use {
    "akinsho/toggleterm.nvim",
    config = function()
      require "plugin.terminal"
    end,
  }
  use {
    "ahmedkhalf/project.nvim",
    config = function()
      require "plugin.project"
    end,
  }
  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugin.autopairs"
    end,
  }

  -- statusline
  use {
    "hoob3rt/lualine.nvim",
    config = function()
      require "plugin.statusline"
    end,
    requires = { "kyazdani42/nvim-web-devicons" },
  }

  -- tpope
  use "tpope/vim-dispatch"
  use "tpope/vim-fugitive"
  use "tpope/vim-sensible"
  use "tpope/vim-sleuth"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "tpope/vim-surround"
  use "tpope/vim-vinegar"
  use "tpope/vim-obsession"
  use "tpope/vim-commentary"
  use "tpope/vim-rsi"
  use "tpope/vim-scriptease"
  use "tpope/vim-eunuch"
  use "tpope/vim-characterize"
  use "tpope/vim-markdown"
end)
