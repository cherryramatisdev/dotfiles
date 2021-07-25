---@diagnostic disable: undefined-global

-- TODO: Discover why astronauta.nvim vim.keymap is not working here
vim.cmd [[ inoremap <Tab> <cmd>lua return require"snippets".expand_or_advance(1)<CR> ]]
vim.cmd [[ inoremap <S-Tab> <cmd>lua return require"snippets".advance_snippet(-1)<CR> ]]

vim.cmd [[ command! EditSnippets <cmd>vs ~/Documents/dotfiles/.config/nvim/lua/cherry/snippets.lua<CR> ]]

local snippets = require "snippets"
local U = require "snippets.utils"
snippets.snippets = {
  typescript = {
    log = "console.log($0)",
    it = U.match_indentation [[
        it('$1', async () => {
            $0
        })
        ]]
  },
  lua = {
    req = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = require '$1']],
    func = [[function${1|vim.trim(S.v):gsub("^%S"," %0")}(${2|vim.trim(S.v)})$0 end]],
    ["local"] = [[local ${2:${1|S.v:match"([^.()]+)[()]*$"}} = ${1}]],
    -- Match the indentation of the current line for newlines.
    ["for"] = U.match_indentation [[
        for ${1:i}, ${2:v} in ipairs(${3:t}) do
        $0
        end]]
  }
}
