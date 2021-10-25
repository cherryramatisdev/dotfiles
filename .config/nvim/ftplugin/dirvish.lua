_G.create_file = function()
  local file_name = vim.fn.input "File name: "

  if string.len(file_name) > 0 then
    vim.cmd(string.format("silent !touch %s", file_name))
  end
end

_G.create_directory = function()
  local file_name = vim.fn.input "Dir name: "

  if string.len(file_name) > 0 then
    vim.cmd(string.format("silent !mkdir %s", file_name))
  end
end

_G.remove_target = function()
  local confirmed = vim.fn.confirm("Save changes?", "&Yes\n&No")

  if confirmed == 1 then
    local line = vim.fn.getline "."
    vim.cmd(string.format("silent !rm -rf %s", line))
  end
end

vim.cmd [[ nmap <buffer> l <cr> ]]
vim.cmd [[ nmap <buffer> h <Plug>(dirvish_up) ]]
vim.cmd [[ nmap <buffer> a :lua create_file()<cr> ]]
vim.cmd [[ nmap <buffer> A :lua create_directory()<cr> ]]
vim.cmd [[ nmap <buffer> dd :lua remove_target()<CR> ]]
