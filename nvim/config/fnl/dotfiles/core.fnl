(module dotfiles.core
  {require {nvim aniseed.nvim}})

(set nvim.o.autowrite true)

(def- tabwidth 2)
(set nvim.o.tabstop tabwidth)
(set nvim.o.softtabstop tabwidth)
(set nvim.o.shiftwidth tabwidth)
(set nvim.o.smartindent true)
(set nvim.o.expandtab true)

(set nvim.o.splitright true)
(set nvim.o.splitbelow true)

(set nvim.o.number true)
(set nvim.o.relativenumber true)

(set nvim.o.clipboard :unnamedplus)
(set nvim.o.guicursor "")

(set nvim.o.laststatus 3)
(set nvim.o.winbar "%f %m")

(set nvim.o.backup false)
(set nvim.o.swapfile false)
(set nvim.o.writebackup false)

(set nvim.o.linebreak true)

(when (nvim.fn.executable "rg")
  (set nvim.o.grepprg "rg --vimgrep --smart-case --hidden")
  (set nvim.o.grepformat "%f:%l:%c:%m"))

(vim.keymap.set :n "[q" "<cmd>cprev<cr>")
(vim.keymap.set :n "]q" "<cmd>cnext<cr>")
