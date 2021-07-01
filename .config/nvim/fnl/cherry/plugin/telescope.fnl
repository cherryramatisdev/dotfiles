(module cherry.plugin.telescope
  {autoload {nvim aniseed.nvim
             actions telescope.actions
             builtin telescope.builtin
             tele telescope}})

(tele.setup {:defaults 
             {:find_command ["rg" "--no-heading" "--with-filename" "--line-number" "--column" "--smart-case"]
              :mappings {:i {:<Esc> actions.close 
                             :<C-j> actions.move_selection_next
                             :<C-k> actions.move_selection_previous}
                         :n {:<Esc> actions.close
                             :<C-j> actions.move_selection_next
                             :<C-k> actions.move_selection_previous}}}})

(defn search_dotfiles []
  "Search telescope prompt using pwd to dotfiles"
  (builtin.find_files {:prompt_title "< VimRC >"
                       :cwd "$HOME/Documents/dotfiles/.config/"}))

(nvim.set_keymap :n :<leader><space> ":Telescope find_files<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>bb ":Telescope buffers<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>. ":Telescope file_browser<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>ps ":Telescope file_browser<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>vrc ":lua require('cherry.plugin.telescope').search_dotfiles()<CR>" {:noremap true})
