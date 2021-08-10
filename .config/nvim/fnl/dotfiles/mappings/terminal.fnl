(module dotfiles.mappings.terminal
  {autoload {nvim aniseed.nvim}})

(defn- map [from to]
  (nvim.set_keymap :t from to {:noremap true}))

(map "<C-]>" "<C-\\><C-n>")

(map "<C-h>" "<C-\\><C-n>:vertical resize -4<CR>")
(map "<C-j>" "<C-\\><C-n>:resize -4<CR>")
(map "<C-k>" "<C-\\><C-n>:resize +4<CR>")
(map "<C-l>" "<C-\\><C-n>:vertical resize +4<CR>")

(map "<C-w>h" "<C-\\><C-n><C-w>h")
(map "<C-w>j" "<C-\\><C-n><C-w>j")
(map "<C-w>k" "<C-\\><C-n><C-w>k")
(map "<C-w>l" "<C-\\><C-n><C-w>l")
