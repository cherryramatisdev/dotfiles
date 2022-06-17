local _2afile_2a = "/home/cherry/.config/nvim/fnl/dotfiles/statusline.fnl"
local _2amodule_name_2a = "dotfiles.statusline"
local _2amodule_2a
do
  package.loaded[_2amodule_name_2a] = {}
  _2amodule_2a = package.loaded[_2amodule_name_2a]
end
local _2amodule_locals_2a
do
  _2amodule_2a["aniseed/locals"] = {}
  _2amodule_locals_2a = (_2amodule_2a)["aniseed/locals"]
end
local a, nvim, str = require("aniseed.core"), require("aniseed.nvim"), require("aniseed.string")
do end (_2amodule_locals_2a)["a"] = a
_2amodule_locals_2a["nvim"] = nvim
_2amodule_locals_2a["str"] = str
local init_group = vim.api.nvim_create_augroup("init_group", {clear = false})
do end (_2amodule_2a)["init_group"] = init_group
local reset_group = vim.api.nvim_create_augroup("reset_group", {clear = false})
do end (_2amodule_2a)["reset_group"] = reset_group
local function _1_()
  local wc = a.get(vim.fn.wordcount(), "words")
  if (wc == 0) then
    nvim.b.wordcount = ""
    return nil
  elseif (wc == 1) then
    nvim.b.wordcount = ("| " .. wc .. " word")
    return nil
  else
    nvim.b.wordcount = ("| " .. wc .. " words")
    return nil
  end
end
vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "CursorHoldI"}, {desc = "word count for the statusline", pattern = {"*.md", "*.txt"}, callback = _1_, group = init_group})
local function _3_()
  if (str.trim(vim.fn.system("git rev-parse --is-inside-work-tree")) == "true") then
    local branch = vim.fn.system("git branch --show-current | tr -d '\n'")
    nvim.b.branch_name = (" [" .. branch .. "] ")
  else
  end
  local num_errors = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.ERROR})
  local num_warnings = #vim.diagnostic.get(0, {severity = vim.diagnostic.severity.WARN})
  if (num_errors > 0) then
    nvim.b.errors = (" \239\153\152 " .. num_errors .. " ")
  else
  end
  if (num_warnings > 0) then
    nvim.b.errors = (nvim.b.errors .. " \239\129\177 " .. num_warnings .. " ")
    return nil
  else
    return nil
  end
end
vim.api.nvim_create_autocmd({"BufEnter", "CursorHold", "FocusGained"}, {desc = "git branch and LSP errors for the statusline", callback = _3_, group = init_group})
nvim.o.statusline = "%{get(b:, \"branch_name\", \"\")} %{get(b:, \"errors\", \"\")} %{get(b:, \"wordcount\", \"\")}"
return _2amodule_2a