let mapleader = ' '

call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'

Plug 'elixir-editors/vim-elixir'

Plug 'folke/lsp-colors.nvim'
Plug 'gruvbox-community/gruvbox'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'numToStr/Comment.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'
Plug 'tpope/vim-endwise'

Plug 'windwp/nvim-autopairs'

Plug 'vimwiki/vimwiki'

Plug 'sbdchd/neoformat'

Plug 'wincent/ferret'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'mattn/emmet-vim'
Plug 'lewis6991/impatient.nvim'

Plug 'joukevandermaas/vim-ember-hbs'

call plug#end()

" Load the colorscheme
set background=dark
colorscheme gruvbox

" Lua deps
lua require('impatient')
lua << EOF
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
  map_cr = true
})
EOF
lua require('Comment').setup()

augroup formatters
    autocmd!
    autocmd BufWritePre * Neoformat
    autocmd BufWritePre * %s/\s\+$//e
augroup END
