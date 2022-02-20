return require "packer".startup(
  function()
    use "wbthomason/packer.nvim"

    use "tjdevries/colorbuddy.vim"
    use {
      "tjdevries/gruvbuddy.nvim",
      config = function()
        require("colorbuddy").colorscheme("gruvbuddy")
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

    use "tpope/vim-vinegar"

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

    use "TimUntersberger/neogit"

    use "voldikss/vim-floaterm"

    use "nvim-orgmode/orgmode"

    use {
      "pwntester/octo.nvim",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "kyazdani42/nvim-web-devicons"
      },
      config = function()
        require "octo".setup()
      end
    }

    use {
      "ThePrimeagen/refactoring.nvim",
      requires = {
        {"nvim-lua/plenary.nvim"},
        {"nvim-treesitter/nvim-treesitter"}
      }
    }
  end
)
