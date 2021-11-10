return require("packer").startup(function()
  -- Packer can manage itself
  use "wbthomason/packer.nvim"

  -- coding stuff
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-cmdline" },
      { "f3fora/cmp-spell" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-nvim-lua" },
      { "dcampos/cmp-snippy" },
    },
  }
  use {
    "jose-elias-alvarez/null-ls.nvim",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require "plugin.lsp.linting"
    end,
  }
  use {
    "RishabhRD/nvim-lsputils",
    requires = { {
      "RishabhRD/popfix",
    } },
    config = function()
      require "plugin.lsp.utils"
    end,
  }
  use "williamboman/nvim-lsp-installer"
  use {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugin.lsp"
    end,
  }
  use "onsails/lspkind-nvim"

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
    },
    config = function()
      require "plugin.telescope"
    end,
  }
  use {
    "nvim-telescope/telescope-arecibo.nvim",
    rocks = { "openssl", "lua-http-parser" },
  }

  -- file browser
  use {
    "kyazdani42/nvim-tree.lua",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require "plugin.file_browser"
    end,
  }

  -- colorscheme
  use {
    "Mofiqul/vscode.nvim",
    config = function()
      require "plugin.colorscheme"
    end,
  }

  -- snippets
  use {
    "dcampos/nvim-snippy",
    config = function()
      require "plugin.snippets"
    end,
  }

  -- misc
  use "jxnblk/vim-mdx-js"
  use {
    "jghauser/mkdir.nvim",
    config = function()
      require "mkdir"
    end,
  }
  use {
    "ThePrimeagen/harpoon",
    requires = { { "nvim-lua/plenary.nvim" }, { "nvim-lua/popup.nvim" } },
    config = function()
      require "plugin.harpoon"
    end,
  }
  use {
    "lewis6991/gitsigns.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      require("gitsigns").setup()
    end,
  }
  use {
    "vuki656/package-info.nvim",
    requires = "MunifTanjim/nui.nvim",
    config = function()
      require "plugin.npm"
    end,
  }
  use "mtth/scratch.vim"
  use "tjdevries/astronauta.nvim"
  use {
    "windwp/nvim-spectre",
    requires = { { "nvim-lua/plenary.nvim" } },
    config = function()
      require "plugin.spectre"
    end,
  }
  use {
    "norcalli/nvim-terminal.lua",
    ft = "terminal",
    config = function()
      require("terminal").setup()
    end,
  }
  use {
    "famiu/feline.nvim",
    config = function()
      require "plugin.statusline"
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
  use "inkarkat/vim-ReplaceWithRegister"
  use "kana/vim-textobj-user"
  use "kana/vim-textobj-line"
  use "kana/vim-textobj-entire"

  use "tweekmonster/startuptime.vim"
  use {
    "windwp/nvim-autopairs",
    config = function()
      require "plugin.autopairs"
    end,
  }
  use "stefandtw/quickfix-reflector.vim"

  -- icons
  use { "kyazdani42/nvim-web-devicons" }

  --SQL
  use "tpope/vim-dadbod"
  use "kristijanhusak/vim-dadbod-completion"
  use "kristijanhusak/vim-dadbod-ui"

  -- tpope
  use "tpope/vim-fugitive"
  use "tpope/vim-repeat"
  use "tpope/vim-unimpaired"
  use "tpope/vim-surround"
  use "tpope/vim-commentary"
  use "tpope/vim-rsi"
  use "tpope/vim-scriptease"
  use "tpope/vim-dotenv"

  -- markdown
  use "ellisonleao/glow.nvim"
  use "ferrine/md-img-paste.vim"
  use {
    "jakewvincent/mkdnflow.nvim",
    config = function()
      require("mkdnflow").setup {}
    end,
  }
end)
