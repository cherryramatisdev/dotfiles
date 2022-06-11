(module dotfiles.plugin.colorscheme
  {require {util dotfiles.util
            nvim aniseed.nvim}})

(util.load-plugin :srcery-vim)

(nvim.ex.colorscheme :srcery)
