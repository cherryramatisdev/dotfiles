local utils = require 'cherry.utils'

require("harpoon").setup(
  {
    global_settings = {
      save_on_toggle = false,
      save_on_change = true
    }
  }
)

utils.noremap('t', '<Esc>', '<C-\\><C-n>', { noremap = true })
utils.noremap('n', '<leader>1', ":lua require('harpoon.term').gotoTerminal(1)<CR>", { noremap = true })
utils.noremap('n', '<leader>2', ":lua require('harpoon.term').gotoTerminal(2)<CR>", { noremap = true })
utils.noremap('n', '<leader>3', ":lua require('harpoon.term').gotoTerminal(3)<CR>", { noremap = true })
utils.noremap('n', '<leader>4', ":lua require('harpoon.term').gotoTerminal(4)<CR>", { noremap = true })
utils.noremap('n', '<leader>cc', ":lua require('cherry.projects').compile()<CR>", { noremap = true })

utils.noremap('n', '<leader>a', ":lua require('harpoon.mark').add_file()<CR>", { noremap = true })
utils.noremap('n', '<leader>e', ":lua require('harpoon.ui').toggle_quick_menu()<CR>", { noremap = true })
utils.noremap('n', '<C-h>', ":lua require('harpoon.ui').nav_file(1)<CR>", { noremap = true })
utils.noremap('n', '<C-j>', ":lua require('harpoon.ui').nav_file(2)<CR>", { noremap = true })
utils.noremap('n', '<C-k>', ":lua require('harpoon.ui').nav_file(3)<CR>", { noremap = true })
utils.noremap('n', '<C-l>', ":lua require('harpoon.ui').nav_file(4)<CR>", { noremap = true })
