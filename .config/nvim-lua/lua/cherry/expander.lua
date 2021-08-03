---@diagnostic disable: undefined-global
local M = {}

local tag_expands = {div = "<div></div>", span = "<span></span>"}

function M:expand_tags()
  local current_word = vim.fn.expand("<cword>")

  vim.fn.append(vim.fn.line("."), string.format("%s", tag_expands[current_word]))
end

return M
