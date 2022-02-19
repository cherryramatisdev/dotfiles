local ls = require "luasnip"
local types = require "luasnip.util.types"

ls.config.set_config {
  -- This tells LuaSnip to remember to keep around the last snippet.
  -- You can jump back into it even if you move outside of the selection
  history = true,
  -- This one is cool cause if you have dynamic snippets, it updates as you type!
  updateevents = "TextChanged,TextChangedI",
  -- Autosnippets:
  enable_autosnippets = true,
  ext_opts = {
    [types.choiceNode] = {
      active = {
        virt_text = {{"<-", "Error"}}
      }
    }
  }
}

-- create snippet
-- s(context, nodes, condition, ...)
local s = ls.s

-- This is the simplest node.
--  Creates a new text node. Places cursor after node by default.
--  t { "this will be inserted" }
--
--  Multiple lines are by passing a table of strings.
--  t { "line 1", "line 2" }
local t = ls.text_node

-- Insert Node
--  Creates a location for the cursor to jump to.
--      Possible options to jump to are 1 - N
--      If you use 0, that's the final place to jump to.
--
--  To create placeholder text, pass it as the second argument
--      i(2, "this is placeholder text")
local i = ls.insert_node

-- Function Node
--  Takes a function that returns text
local f = ls.function_node

-- This a choice snippet. You can move through with <c-l> (in my config)
--   c(1, { t {"hello"}, t {"world"}, }),
--
-- The first argument is the jump position
-- The second argument is a table of possible nodes.
--  Note, one thing that's nice is you don't have to include
--  the jump position for nodes that normally require one (can be nil)
local c = ls.choice_node

-- Repeats a node
-- rep(<position>)
local rep = require("luasnip.extras").rep

-- This is a format node.
-- It takes a format string, and a list of nodes
-- fmt(<fmt_string>, {...nodes})
local fmt = require("luasnip.extras.fmt").fmt

local tssnips = {
  ls.parser.parse_snippet(
    "rcc",
    [[
	  export const $1: React.FC = () => {
	    return (
	      <div>$1</div>
	    )
	  }
    ]]
  )
}

ls.snippets = {
  all = {
    s(
      {trig = "date"},
      {
        f(
          function()
            return string.format(string.gsub(vim.bo.commentstring, "%%s", " %%s"), os.date())
          end,
          {}
        )
      }
    )
  },
  lua = {
    s("req", fmt("local {} = require('{}')", {i(1), rep(1)}))
  },
  typescript = tssnips,
  typescriptreact = tssnips,
  org = {
    s(
      "todo",
      fmt(
        "[TEC-{}](https://lamimed.atlassian.net/browse/TEC-{}) - {}",
        {
          i(1),
          rep(1),
          i(2)
        }
      )
    )
  },
  gitcommit = {
    s("f", fmt("feat: {}", {i(1)})),
    s("c", fmt("chore: {}", {i(1)})),
    s("fx", fmt("fix: {}", {i(1)})),
    s("r", fmt("refactor: {}", {i(1)}))
  }
}

-- <c-k> is my expansion key
-- this will expand the current item or jump to the next item within the snippet.
vim.keymap.set(
  {"i", "s"},
  "<c-k>",
  function()
    if ls.expand_or_jumpable() then
      ls.expand_or_jump()
    end
  end,
  {silent = true}
)

-- <c-j> is my jump backwards key.
-- this always moves to the previous item within the snippet
vim.keymap.set(
  {"i", "s"},
  "<c-j>",
  function()
    if ls.jumpable(-1) then
      ls.jump(-1)
    end
  end,
  {silent = true}
)

-- <c-l> is selecting within a list of options.
-- This is useful for choice nodes (introduced in the forthcoming episode 2)
vim.keymap.set(
  "i",
  "<c-l>",
  function()
    if ls.choice_active() then
      ls.change_choice(1)
    end
  end
)

-- shorcut to source my luasnips file again, which will reload my snippets
vim.keymap.set("n", "<leader><leader>s", "<cmd>source ~/.config/nvim/after/plugin/luasnip.lua<CR>")
