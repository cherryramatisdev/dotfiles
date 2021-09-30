(module dotfiles.general.sets
  {autoload {nvim aniseed.nvim}})

(set nvim.o.termguicolors true)

(set nvim.o.swapfile false)
(set nvim.o.hlsearch false)

(set nvim.o.cursorline true)
(set nvim.o.showmode false)

(set nvim.o.ignorecase true)
(set nvim.o.smartcase true)
(set nvim.o.textwidth 80)
(set nvim.o.number true)
(set nvim.o.relativenumber true)

(set nvim.o.hidden true)

(set nvim.o.laststatus 2) ;; Always display the statusline in all windows
(set nvim.o.showtabline 2)

(set nvim.o.switchbuf "useopen")
(set nvim.o.showfulltag true)
(set nvim.o.incsearch true)

(set nvim.o.visualbell false)
(set nvim.o.errorbells false)
(set nvim.o.splitbelow true)
(set nvim.o.splitright true)

(set nvim.o.clipboard (.. nvim.o.clipboard "unnamedplus"))

;; Disable backup files
(set nvim.o.undofile false)
(set nvim.o.swapfile false)
(set nvim.o.backup false)

;; lets get it fuzzy
(set nvim.o.path (.. nvim.o.path "**"))

;; If a file is changed outside of vim, automatically reload it without asking
(set nvim.o.autoread true)
(set nvim.o.autoindent true)
(set nvim.o.copyindent true)
(set nvim.o.smartindent true)

(set nvim.o.mouse "a")

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")
