local utils = require("cherry.utils")

vim.cmd [[ let g:dotoo#agenda#files = ['~/org/*.org'] ]]
vim.cmd [[ let g:dotoo#capture#refile = expand('~/org/refile.org') ]]
vim.g.time_format = "%H:%M"
vim.g.date_format = "%Y-%m-%d %a"
vim.g.datetime_format = vim.g.date_format .. " " .. vim.g.time_format

vim.cmd [[ augroup OrgBindings ]]
vim.cmd [[ autocmd FileType orgcapture nmap <buffer> q :lua require"cherry.dotoo".saveCapture()<CR> ]]
vim.cmd [[ augroup END ]]

vim.cmd [[ nmap <Nop> <Plug>(dotoo-capture) ]]

utils.noremap("n", "<leader>t", ':lua require("cherry.fuzzy").search_todos()<CR>', {noremap = true})
utils.noremap("n", "gC", ':lua require("cherry.dotoo").createCapture()<CR>', {noremap = true})

local M = {}

M.saveCapture = function ()
  local dotooCapture = vim.fn.expand("~/org/refile.org")
  local contentArr = vim.api.nvim_buf_get_lines(_G.capture_buf_id, 0, -1, false)
  local content = table.concat(contentArr, "\n")

  vim.api.nvim_exec(string.format('call writefile(["%s"], expand("%s"), "a") | close', contentArr[1], dotooCapture), true)
end

M.createCapture = function()
  local stats = vim.api.nvim_list_uis()[1]
  local width = stats.width
  local height = stats.height

  local bufh = vim.api.nvim_create_buf(false, true)
  vim.api.nvim_buf_set_option(bufh, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(bufh, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(bufh, "filetype", "orgcapture")
  local winId =
    vim.api.nvim_open_win(
    bufh,
    true,
    {
      relative = "editor",
      width = width - 4,
      height = height - 4,
      col = 2,
      row = 2
    }
  )

  _G.capture_buf_id = bufh
end

return M
