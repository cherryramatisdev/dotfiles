local utils = require 'cherry.utils'

vim.cmd [[ let g:dotoo#agenda#files = ['~/org/*.org'] ]]
vim.cmd [[ let g:dotoo#capture#refile = expand('~/org/refile.org') ]]
vim.g.time_format='%H:%M'
vim.g.date_format='%Y-%m-%d %a'
vim.g.datetime_format=vim.g.date_format .. " " .. vim.g.time_format

utils.noremap('n', '<leader>t', ':lua require("cherry.fuzzy").search_todos()<CR>', { noremap = true })
-- utils.noremap('n', 'gC', ':lua require("cherry.dotoo").createCapture()<CR>', { noremap = true })

-- local M = {}

-- M.createCapture = function()
--   local refile = vim.fn.expand('~/org/refile.org')

--   vim.fn.nvim_exec(string.format(':vs %s', refile))
-- end

-- return M

