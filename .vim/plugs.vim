call plug#begin('~/.vim/plugged')

" editing
Plug 'inkarkat/vim-ReplaceWithRegister'

" Text objects
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
Plug 'kana/vim-textobj-function'
Plug 'kana/vim-textobj-entire'

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
Plug 'joereynolds/vim-minisnip'

" coding
Plug 'tommcdo/vim-lion'
Plug 'HerringtonDarkholme/yats.vim'
" or Plug 'leafgarland/typescript-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'jxnblk/vim-mdx-js'
Plug 'fatih/vim-go'

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
end

" Elm setup
Plug 'ElmCast/elm-vim'

" Local plugins
Plug '~/projects/plugins/semantic_git.vim/'

call plug#end()
