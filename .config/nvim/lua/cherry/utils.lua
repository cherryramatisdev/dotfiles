local M = {}

function M:run_current_file()
  if vim.bo.filetype == "lua" then
    vim.api.nvim_command(":luafile %")
  end
end

return M
