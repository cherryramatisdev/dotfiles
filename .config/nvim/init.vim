let mapleader = ' '

call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'

Plug 'junegunn/vim-easy-align'

Plug 'gruvbox-community/gruvbox'

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

Plug 'sbdchd/neoformat'

Plug 'wincent/ferret'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'mattn/emmet-vim'

Plug 'xiyaowong/nvim-transparent'

call plug#end()

set background=dark
colorscheme gruvbox

" Lua stuff
lua require('lsp')

augroup formatters
    autocmd!
    autocmd BufWritePre * Neoformat
    autocmd BufWritePre * %s/\s\+$//e
augroup END
