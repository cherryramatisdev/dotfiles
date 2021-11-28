filetype plugin on
syntax on

set path+=**
set wildignore+=**/node_modules/**
set wildignore+=**/dist/**
set number
set relativenumber
set cursorline
set hidden
set nohlsearch
set ignorecase
set smartcase
set textwidth=80
set laststatus=2
set showtabline=1
set switchbuf=useopen
set showfulltag
set incsearch
set novisualbell
set noerrorbells

" tab width
set tabstop=2
set shiftwidth=2
set expandtab

set splitbelow
set splitright

set completeopt=menuone,noinsert,noselect

set clipboard=unnamedplus

set noundofile
set noswapfile
set nobackup

set wildmenu
set wildmode=list:longest,full

call plug#begin('~/.vim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'morhetz/gruvbox'

Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-rsi'

Plug 'dense-analysis/ale'

Plug 'xolox/vim-session'
Plug 'xolox/vim-misc'

Plug 'jiangmiao/auto-pairs'
Plug 'vimwiki/vimwiki'

Plug 'cespare/vim-toml'
Plug 'rust-lang/rust.vim'

Plug 'wincent/ferret'

call plug#end()

set background=dark
colorscheme gruvbox

nnoremap <C-w>Q :wqall<cr>

" Indent easily
vnoremap > >gv
vnoremap < <gv

nnoremap <Down> :cnext<cr>
nnoremap <Up> :cprev<cr>

let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'typescript': ['eslint', 'prettier'],
\   'typescriptreact': ['eslint', 'prettier'],
\   'rust': ['rustfmt']
\}

let g:ale_linters = {'rust': ['rustc', 'rls']}

let g:ale_fix_on_save = 1
let g:ale_sign_column_always = 1
let g:ale_sign_error = '✗'
let g:ale_sign_warning = ''

set omnifunc=ale#completion#OmniFunc
let g:ale_completion_autoimport = 1

augroup ale_ts
	autocmd!
	autocmd FileType typescript,typescriptreact,rust nmap <buffer> K :ALEHover<CR>
	autocmd FileType typescript,typescriptreact,rust nmap <buffer> gd :ALEGoToDefinition<CR>
augroup END

function! HandleURL()
  let s:uri = matchstr(getline("."), '[a-z]*:\/\/[^ >,;]*')
  if s:uri != ""
    silent exec "Dispatch! brave '".s:uri."'"
  else
    echo "No URI found in line."
  endif
endfunction

function! InsertJiraLink()
  let s:code = input('Jira Code: ')

  if s:code != ''
    let s:jira_link = '[[https://lamimed.atlassian.net/browse/TEC-' . s:code . ']]'
    let line = getline('.')
    let pos = col('.')-1 " IIRC
    let line = line[:pos-1] . s:jira_link . line[pos:]
    call setline('.', line)
  endif
endfunction

augroup vimwiki_config
  autocmd!
  autocmd FileType vimwiki nmap <buffer> <leader>wx :VimwikiToggleListItem<CR>
  autocmd FileType vimwiki nmap <buffer> gx :call HandleURL()<cr>
  autocmd FileType vimwiki nmap <buffer> gi :call InsertJiraLink()<cr>
  autocmd FileType vimwiki nmap <buffer> <C-j> ddp
  autocmd FileType vimwiki nmap <buffer> <C-k> ddP
augroup END

" Statusline
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)
endfunction

set statusline=
set statusline+=\ %{expand('%:p:h:t')}/%t
set statusline+=\ %{FugitiveStatusline()}
set statusline+=%=
set statusline+=%{LinterStatus()}
set statusline+=%=
set statusline+=\ %y
set statusline+=
