---@diagnostic disable: undefined-global
return require("packer").startup(
  function()
    -- Packer can manage itself
    use "wbthomason/packer.nvim"

    -- Provide ftplugin/ and plugin/ autoload for lua
    use "tjdevries/astronauta.nvim"

    -- Parse code and do cool stuff
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use "nvim-treesitter/nvim-treesitter-textobjects"
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "jiangmiao/auto-pairs"

    -- Solidity syntax highlight
    use "tomlion/vim-solidity"

    -- Intellisense for neovim
    use "glepnir/lspsaga.nvim"
    use {"neovim/nvim-lspconfig", requires = {{"kabouzeid/nvim-lspinstall"}}}
    use "hrsh7th/nvim-compe"

    -- My colorscheme
    use {
      "tjdevries/gruvbuddy.nvim",
      requires = {{"tjdevries/colorbuddy.vim"}},
      config = function()
        require("colorbuddy").colorscheme("gruvbuddy")
      end
    }

    -- Fuzzy finder for all stuff inside neovim
    use {
      "nvim-telescope/telescope.nvim",
      requires = {{"nvim-lua/popup.nvim"}, {"nvim-lua/plenary.nvim"}}
    }

    -- Statusline
    use "famiu/feline.nvim"

    -- Snippets
    use "norcalli/snippets.nvim"

    -- Tpope stuff
    use "tpope/vim-vinegar"
    use "tpope/vim-surround"
    use "tpope/vim-repeat"
    use "tpope/vim-rsi"
    use "tpope/vim-commentary"
    use "tpope/vim-fugitive"

    -- The primeagen plugins
    use {"ThePrimeagen/harpoon", requires = {{"nvim-lua/plenary.nvim", "nvim-lua/popup.nvim"}}}
    use "ThePrimeagen/refactoring.nvim"

    -- Formatter
    use "mhartington/formatter.nvim"

    -- Git client
    -- use {"TimUntersberger/neogit", requires = "nvim-lua/plenary.nvim"}

    -- Run tests for multiple filetypes
    use "vim-test/vim-test"

    -- Easymotion
    use "phaazon/hop.nvim"

    -- ToggleTerm(Floats)
    use "akinsho/nvim-toggleterm.lua"
  end
)
