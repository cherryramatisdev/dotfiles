-- TODO: this need to be it's own module.
local function rand(length)
  local res = ""
  ---@diagnostic disable-next-line: unused-local
  for i = 1, length do
    res = res .. string.char(math.random(97, 122))
  end
  return res
end

local M = {}

function M:create()
  local note_prefix = rand(10)
  local note_suffix = vim.fn.strftime "%d-%m-%Y"
  local note_title = vim.fn.input "Note name: "
  local notes_path = vim.fn.expand "~/projects/dotfiles/wiki"

  if string.len(note_title) <= 0 then
    return
  end

  local note_title_formatted = note_title:gsub("%s+", "-"):lower()

  vim.cmd(string.format("vsplit %s/%s-%s-%s.md", notes_path, note_prefix, note_title_formatted, note_suffix))
end

return M
