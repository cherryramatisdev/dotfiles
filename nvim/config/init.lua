function load_plugin(plugin)
  if vim.fn.isdirectory(vim.fn.expand("~/.local/share/nvim/site/pack/dev/opt/" .. plugin)) then
    vim.cmd('packadd ' .. plugin)
  end
end

load_plugin('conjure')
load_plugin('aniseed')
load_plugin('impatient.nvim')

-- Load impatient which pre-compiles and caches Lua modules.
require('impatient')

-- Aniseed uses this local leader for basically every binding, so let's define it earlier.
vim.cmd [[ let maplocalleader = "," ]]

-- Enable Aniseed's automatic compilation and loading of Fennel source code.
vim.g["aniseed#env"] = {
  module = "dotfiles.init",
  compile = true
}
