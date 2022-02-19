local vim = vim
local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/opt/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
  execute "packadd packer.nvim"
end

vim.cmd("packadd packer.nvim")

local packer = require "packer"
local util = require "packer.util"

packer.init(
  {
    package_root = util.join_paths(vim.fn.stdpath("data"), "site", "pack")
  }
)

packer.startup(
  function()
    local use = use

    use "wbthomason/packer.nvim"

    use "tjdevries/colorbuddy.vim"
    use {"tjdevries/gruvbuddy.nvim", config = require("colorbuddy").colorscheme("gruvbuddy")}

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
  end
)
