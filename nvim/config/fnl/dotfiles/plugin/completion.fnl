(module dotfiles.plugin.completion
  {require {nvim aniseed.nvim
            util dotfiles.util}})

(set nvim.o.completeopt "menuone,noselect,noinsert,preview")
(set nvim.o.shortmess (.. nvim.o.shortmess "c"))

(set nvim.g.mucomplete#enable_auto_at_startup 1)
(set nvim.g.mucomplete#chains {:all [:file :omni :keyn]})

(util.load-plugin :vim-mucomplete)
