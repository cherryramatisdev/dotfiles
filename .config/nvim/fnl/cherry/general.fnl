(module cherry.general
  {autoload {nvim aniseed.nvim}})

(set nvim.o.termguicolors true)
(set nvim.o.hidden true)
(set nvim.o.updatetime 500)
(set nvim.o.timeoutlen 500)
(set nvim.o.sessionoptions "blank,curdir,folds,help,tabpages,winsize")
(set nvim.o.inccommand :split)
(set nvim.o.splitright true)
(set nvim.o.splitbelow true)
(set nvim.o.clipboard :unnamedplus)

(nvim.ex.set :list)
