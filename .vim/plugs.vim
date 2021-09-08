call plug#begin('~/.vim/plugged')

" tpope fandom
Plug 'tpope/vim-sleuth'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rsi'

" misc
Plug 'bronson/vim-trailing-whitespace'
Plug 'terryma/vim-multiple-cursors'

" coding
Plug 'tommcdo/vim-lion'
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jxnblk/vim-mdx-js'

" Andrew radev fandom
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/tagalong.vim'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'AndrewRadev/sideways.vim'
Plug 'AndrewRadev/deleft.vim'
Plug 'AndrewRadev/ginitpull.vim'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Org mode support for my agenda
Plug 'kristijanhusak/orgmode.nvim'

" Lsp on neovim
if has('nvim')
  Plug 'neovim/nvim-lspconfig'
  Plug 'ms-jpq/coq_nvim', {'branch': 'coq'}
  Plug 'ms-jpq/coq.artifacts', {'branch': 'artifacts'}
end

call plug#end()
