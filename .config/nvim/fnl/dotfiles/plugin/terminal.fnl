(module dotfiles.plugin.terminal
  {autoload {nvim aniseed.nvim
             t toggleterm}})

(t.setup {:size 20
          :open_mappings "<c-t>"
          :hide_numbers true
          :shade_terminals true
          :start_in_insert true
          :insert_mappings true
          :persist_size true
          :direction "float"
          :close_on_exit true})

(nvim.set_keymap :n :<c-t> ":ToggleTerm<cr>" {:noremap true})
(nvim.set_keymap :t :<c-t> "<cmd>ToggleTerm<cr>" {:noremap true})
