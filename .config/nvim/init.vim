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
	endif
endif

" Define colorscheme
let g:cherry_colorscheme="paramount"
