local M = {}

function M:rand(length)
  print("teste", length)
  local res = ""
  ---@diagnostic disable-next-line: unused-local
  for i = 1, length do
    res = res .. string.char(math.random(97, 122))
  end
  return res
end

return M
