(module dotfiles.plugin.treesitter
  {autoload {nvim aniseed.nvim
             treesitter nvim-treesitter.configs}})

(treesitter.setup
  {:ensure_installed :all
   :highlight {:enable true
               :additional_vim_regex_highlighting false}})

; (nvim.set_keymap :n :<tab> :za {:noremap true})
; (set nvim.o.foldmethod "expr")
; (set nvim.o.foldexpr "nvim_treesitter#foldexpr()")
