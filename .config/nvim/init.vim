let mapleader = ' '

call plug#begin(stdpath('data') . '/plugged')

Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/nvim-lsp-installer'
Plug 'tami5/lspsaga.nvim'

Plug 'folke/lsp-colors.nvim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }

Plug 'vim-scripts/ReplaceWithRegister'

Plug 'numToStr/Comment.nvim'

Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-rsi'

Plug 'windwp/nvim-autopairs'

Plug 'vimwiki/vimwiki'

Plug 'sbdchd/neoformat'

Plug 'wincent/ferret'

" telescope requirements...
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'JoosepAlviste/nvim-ts-context-commentstring'

Plug 'mattn/emmet-vim'

Plug 'lewis6991/impatient.nvim'

Plug 'ggandor/lightspeed.nvim'

call plug#end()

let g:tokyonight_style = "night"
let g:tokyonight_italic_functions = 1
let g:tokyonight_sidebars = ["qf", "terminal"]

" Change the "hint" color to the "orange" color, and make the "error" color bright red
let g:tokyonight_colors = {
  \ 'hint': 'orange',
  \ 'error': '#ff0000'
\ }

" Load the colorscheme
colorscheme tokyonight

" Lua deps
lua require('impatient')
lua << EOF
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" },
  map_cr = true
})
EOF
lua require('Comment').setup()

" My lua stuff
lua require('lsp')

augroup formatters
    autocmd!
    autocmd BufWritePre * Neoformat
    autocmd BufWritePre * %s/\s\+$//e
augroup END
