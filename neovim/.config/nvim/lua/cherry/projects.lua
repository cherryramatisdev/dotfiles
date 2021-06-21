local Projects = {}
local harpoon = require("harpoon.term")

local fronts = {
  "/Users/fabioramatis/Documents/projects/cdc/cliente",
  "/Users/fabioramatis/Documents/projects/conductor/frontend"
}
local backs = {
  "/Users/fabioramatis/Documents/projects/cdc/backend",
  "/Users/fabioramatis/Documents/projects/conductor/backend"
}

local function has_value(tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

Projects.compile = function()
  local currentFile = vim.fn.expand("%:p:h")
  if has_value(fronts, currentFile) then
    harpoon.sendCommand(1, "npm run dev\n")
  elseif has_value(backs, currentFile) then
    harpoon.sendCommand(1, "npm run start:dev\n")
  else
    harpoon.sendCommand(1, string.format("%s\n", vim.fn.input('Command to compile > ')))
  end
end

return Projects
