(module dotfiles.mappings
  {autoload {nvim aniseed.nvim
             utils dotfiles.utils}})

(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader ",")

(utils.map->leader :w ":w")
(utils.map->leader :s :sp)
(utils.map->leader :v :vs)
(utils.map->leader :Q :wqall)

;; Edit command
(vim.cmd "map <leader>ew <Esc>:e %%")
(vim.cmd "map <leader>es <Esc>:sp %%")
(vim.cmd "map <leader>ev <Esc>:vsp %%")
(vim.cmd "map <leader>et <Esc>:tabe %%")

;; Open lazygit on terminal
(utils.map->leader :g :LazyGit)

;; Open terminal running :term
(utils.map->leader :t :term)
