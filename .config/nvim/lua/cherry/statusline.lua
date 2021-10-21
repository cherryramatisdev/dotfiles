local git_branch = ""
local status_line = ""

local function constrain_string(line, max_len, cut_on_end)
  if #line <= max_len then
    return line
  end

  if cut_on_end then
    return line:sub(max_len - 3) .. "..."
  end
  return "..." .. line:sub(max_len - 3)
end

local function get_file_name()
  local name = vim.fn.bufname(0)

  if not name or name == "" then
    return "(no name)"
  end

  return name
end

local function get_git_info()
  git_branch = vim.fn["fugitive#head"]()
  if not git_branch or git_branch == "" then
    return "(no git)"
  end

  return string.format("(%s)", git_branch)
end

local function lsp_info()
  local warnings = vim.lsp.diagnostic.get_count(0, "Warning")
  local errors = vim.lsp.diagnostic.get_count(0, "Error")
  local hints = vim.lsp.diagnostic.get_count(0, "Hint")

  return string.format("LSP: H %d W %d E %d", hints, warnings, errors)
end

local statusline = "%%-4.4(%s%%)%%-15.23(%s%%)|%%-14.14(%s%%)%%-20.20(%s%%)%%-6.6(%s%%)%%-30.70(%s%%)"
function StatusLine()
  return string.format(
    statusline,
    vim.fn.mode(),
    constrain_string(get_file_name(), 23, false),
    get_git_info(),
    lsp_info(),
    "❤️",
    status_line
  )
end

vim.o.statusline = "%!v:lua.StatusLine()"

local M = {}

M.set_status = function(line)
  status_line = line
end

return M
