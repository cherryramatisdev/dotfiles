(module dotfiles.plugin.telescope
  {autoload {nvim aniseed.nvim
             utils dotfiles.utils
             t telescope
             actions telescope.actions}})

(t.setup
  {:defaults
   {:vimgrep_arguments ["rg" "--color=never" "--no-heading"
                        "--with-filename" "--line-number" "--column"
                        "--smart-case" "--hidden" "--follow"
                        "-g" "!.git/"]
    :mappings {:i {:<Esc> actions.close
                   :<C-j> actions.move_selection_next
                   :<C-k> actions.move_selection_previous}
               :n {:<Esc> actions.close
                   :<C-j> actions.move_selection_next
                   :<C-k> actions.move_selection_previous}}}})

(utils.map->normal :<C-p> "Telescope find_files hidden=true follow=true" {})
(utils.map->normal :<C-f> "Telescope live_grep" {})
