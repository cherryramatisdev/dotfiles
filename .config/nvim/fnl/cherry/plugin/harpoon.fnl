(module cherry.plugin.harpoon
  {autoload {nvim aniseed.nvim
             harpoon harpoon}})

(harpoon.setup {})

(nvim.set_keymap :n :<leader>a ":lua require('harpoon.mark').add_file()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>e ":lua require('harpoon.ui').toggle_quick_menu()<CR>" {:noremap true})

(nvim.set_keymap :n :<C-h> ":lua require('harpoon.ui').nav_file(1)<CR>" {:noremap true})
(nvim.set_keymap :n :<C-j> ":lua require('harpoon.ui').nav_file(2)<CR>" {:noremap true})
(nvim.set_keymap :n :<C-k> ":lua require('harpoon.ui').nav_file(3)<CR>" {:noremap true})
(nvim.set_keymap :n :<C-l> ":lua require('harpoon.ui').nav_file(4)<CR>" {:noremap true})

(nvim.set_keymap :n :<leader>1 ":lua require('harpoon.term').gotoTerminal(1)<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>2 ":lua require('harpoon.term').gotoTerminal(2)<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>3 ":lua require('harpoon.term').gotoTerminal(3)<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>4 ":lua require('harpoon.term').gotoTerminal(4)<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>5 ":lua require('harpoon.term').gotoTerminal(5)<CR>" {:noremap true})
