local ls = require "luasnip"

ls.config.set_config {
  history = true,
  updateevents = "TextChanged,TextChangedI",
}

-- create snippet
-- s(context, nodes, condition, ...)
local snippet = ls.s
-- local snippet_from_nodes = ls.sn

-- This a choice snippet. You can move through with <c-e> (in my config)
-- tbl_snip {
--   trig = "c",
--   t { "-- this has a choice: " },
--   c(1, { t {"hello"}, t {"world"}, }),
--   i(0),
-- }
-- local c = ls.c -- choice node

-- local f = ls.f -- function node
local i = ls.i -- insert node
local t = ls.t -- text node
-- local d = ls.d -- dynamic node

local shortcut = function(val)
  if type(val) == "string" then
    return { t { val }, i(0) }
  end

  if type(val) == "table" then
    for k, v in ipairs(val) do
      if type(v) == "string" then
        val[k] = t { v }
      end
    end
  end

  return val
end

local make = function(tbl)
  local result = {}
  for k, v in pairs(tbl) do
    table.insert(result, (snippet({ trig = k, desc = v.desc }, shortcut(v))))
  end

  return result
end

local newline = function(text)
  return t { "", text }
end

local snippets = {}

snippets.lua = make {
  p = {
    "print(",
    i(0),
    ")",
  },
  func = {
    "function(",
    i(1),
    ")",
    i(0),
    newline "end",
  },
}

snippets.typescript = make {
  log = { "console.log(", i(0), ")" },
  ["if"] = { "if(", i(1), ")", "{", i(0), newline "}" },
}

ls.filetype_extend("typescriptreact", { "typescript" })

ls.snippets = snippets
ls.autosnippets = {
  all = {
    snippet("autotrigger", {
      t "autosnippet",
    }),
  },
}

vim.cmd [[
  imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
  inoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>
  imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
  snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<CR>
  snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<CR>
]]
