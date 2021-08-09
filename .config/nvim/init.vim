" Load plugins
let s:load_plugins = 1

if s:load_plugins == 1
    if has('packages')
        " Tpope
        packadd! vim-commentary
        packadd! vim-surround
        packadd! vim-fugitive
        packadd! vim-rsi
        packadd! vim-sensible
        packadd! vim-vinegar
        packadd! vim-repeat
        packadd! vim-speeddating
        packadd! vim-markdown

        " Lsp
        packadd! nvim-compe
        packadd! nvim-lspconfig
        packadd! nvim-lspinstall
        packadd! lspsaga.nvim

        " Snippets
        packadd! vim-vsnip
        packadd! vim-vsnip-integ

        " Treesitter
        packadd! nvim-treesitter

        " Fuzzy
        packadd! popup.nvim
        packadd! plenary.nvim
        packadd! telescope.nvim

        " Formatter
        packadd! formatter.nvim

        " Run tests
        packadd! vim-test

        " Rust stuff
        packadd! togglerust

        " Git client using lazygit
        packadd! lazygit.nvim

        " Personal wiki
        packadd! vimwiki

        " Org mode
        packadd! orgmode.nvim
    endif
endif

" Define colorscheme
let g:cherry_colorscheme="paramount"

" TODO: Discover how to use this outside of init.vim
let g:vimwiki_list = [{'path': '~/projects/dotfiles/wiki',
            \ 'syntax': 'markdown', 'ext': '.md'}]

let g:vimwiki_key_mappings =
            \ {
                \   'all_maps': 1,
                \   'global': 0,
                \   'headers': 1,
                \   'text_objs': 1,
                \   'table_format': 1,
                \   'table_mappings': 1,
                \   'lists': 1,
                \   'links': 0,
                \   'html': 0,
                \   'mouse': 0,
                \ }
