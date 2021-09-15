let g:package_path=''

if has('nvim')
  let g:package_path = stdpath('data') . '/plugged'
else
  let g:package_path = '~/.vim/plugged'
endif

call plug#begin(g:package_path)

" editing
Plug 'inkarkat/vim-ReplaceWithRegister'
Plug 'cohama/lexima.vim'

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
Plug 'SirVer/ultisnips'
Plug 'ekickx/clipboard-image.nvim'
Plug 'twitvim/twitvim'
Plug 'dhruvasagar/vim-open-url'
Plug 'tomasiser/vim-code-dark'

" coding
Plug 'tommcdo/vim-lion'
Plug 'HerringtonDarkholme/yats.vim'
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
Plug '~/projects/plugins/translator.vim/'

" An http client for vimscript
Plug 'mattn/webapi-vim'

call plug#end()
