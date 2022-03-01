vim.g.mapleader = " "
vim.cmd [[ set clipboard+=unnamedplus ]]

require "cherry.globals"

require "cherry.plugins"

require "cherry.completion"
require "cherry.lsp"

require "cherry.telescope.setup"
require "cherry.telescope.mappings"

require "cherry.treesitter"

require "cherry.formatter"
