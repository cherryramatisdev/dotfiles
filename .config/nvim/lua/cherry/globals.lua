_G.create_file = function()
  local file_name = vim.fn.input "File name: "

  local file_path = string.format("%s/%s", vim.fn.expand "%", file_name)

  if string.len(file_name) > 0 then
    vim.cmd(string.format("silent !touch %s", file_path))
  end
end

_G.create_directory = function()
  local dir_name = vim.fn.input "Dir name: "

  local dir_path = string.format("%s/%s/", vim.fn.expand "%", dir_name)

  if string.len(dir_name) > 0 then
    vim.cmd(string.format("silent !mkdir %s", dir_path))
  end
end

_G.remove_target = function()
  local confirmed = vim.fn.confirm("Save changes?", "&Yes\n&No")

  if confirmed == 1 then
    local line = vim.fn.getline "."
    vim.cmd(string.format("silent !rm -rf %s", line))
  end
end
