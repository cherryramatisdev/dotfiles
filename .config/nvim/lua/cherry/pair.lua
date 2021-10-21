-- Command to setup neovim for pair programming
local M = {}

function M:lets_pair()
  vim.cmd [[ colorscheme vscode ]]
  vim.opt.listchars = ""
  vim.opt.relativenumber = false
end

return M
