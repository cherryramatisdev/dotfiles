local Utils = {}

Utils.noremap = function(mode, key, func, opts)
  vim.api.nvim_set_keymap(mode, key, func, opts)
end

Utils.quit = function()
  if vim.bo.filetype == "quickrun" then
    vim.api.nvim_exec("q", true)
  elseif vim.bo.filetype == "help" then
    vim.api.nvim_exec("q", true)
  elseif string.len(vim.fn.expand("%")) > 0 then
    vim.api.nvim_exec("wq", true)
  else
    vim.api.nvim_exec("q!", true)
  end
end

Utils.load_code = function()
  if vim.bo.filetype == "lua" then
    vim.api.nvim_exec("luafile %", true)
  elseif vim.bo.filetype == "vim" then
    vim.api.nvim_exec("so %", true)
  end
end

-- "Safe" version of `nvim_buf_get_var()` that returns `nil` if the
-- variable is not set.
Utils.buf_get_var = function(handle, name)
  local result
  pcall(
    function()
      result = vim.api.nvim_buf_get_var(handle, name)
    end
  )
  return result
end

-- "Safe" version of `nvim_get_var()` that returns `nil` if the
-- variable is not set.
Utils.get_var = function(name)
  local result
  pcall(
    function()
      result = vim.api.nvim_get_var(name)
    end
  )
  return result
end

-- "Safe" version of `nvim_tabpage_get_var()` that returns `nil` if the
-- variable is not set.
Utils.tabpage_get_var = function(handle, name)
  local result
  pcall(
    function()
      result = vim.api.nvim_tabpage_get_var(handle, name)
    end
  )
  return result
end

-- "Safe" version of `nvim_win_get_var()` that returns `nil` if the
-- variable is not set.
Utils.win_get_var = function(handle, name)
  local result
  pcall(
    function()
      result = vim.api.nvim_win_get_var(handle, name)
    end
  )
  return result
end

return Utils
