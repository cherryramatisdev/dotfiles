(module cherry.mapping
  {autoload {nvim aniseed.nvim }})

(defn- noremap [mode from to]
  "Sets a mapping with {:noremap true}."
  (nvim.set_keymap mode from to {:noremap true}))

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(noremap :n ";" ":")

(noremap :n :gl "$")
(noremap :n :gh "^")

;; Leader base mappings
(noremap :n :<leader>fs ":w<CR>")
(noremap :n :<leader>bd ":bd<CR>")
(noremap :n :<leader>wd ":q<CR>")
(noremap :n :<leader>ws "<C-w>s")
(noremap :n :<leader>wv "<C-w>v")
(noremap :n :<leader>wo "<C-w>o")
(noremap :n :<leader>qq ":wqall<CR>")
(noremap :n :<leader>h "<C-w>h")
(noremap :n :<leader>j "<C-w>j")
(noremap :n :<leader>k "<C-w>k")
(noremap :n :<leader>l "<C-w>l")

(noremap :t "<C-[>" :<C-\><C-n> {:noremap true})

