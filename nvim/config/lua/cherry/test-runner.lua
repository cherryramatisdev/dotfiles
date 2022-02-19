local prefix_runner = "FloatermNew --autoclose=0"

local function define_test_script()
  if vim.bo.filetype == "typescript" then
    return "yarn test"
  end

  if vim.bo.filetype == "lua" then
    return "ls"
  end
end

local function run_all()
  local runner = prefix_runner .. " " .. define_test_script()
  vim.cmd(runner)
end

local function run_file()
  local runner = prefix_runner .. " " .. define_test_script() .. " " .. vim.fn.expand("%")

  vim.cmd(runner)
end

-- TODO: discover how to get text inside quotes, so we can discover the test title
local function run_nearest()
  local test_line = vim.api.nvim_get_current_line()
  local test_title = string.match("'teste'", "'\\(.*?\\)'")

  P({test_title = test_title})
end

vim.keymap.set(
  "n",
  "<leader>ta",
  function()
    run_all()
  end
)
vim.keymap.set(
  "n",
  "<leader>tf",
  function()
    run_file()
  end
)
vim.keymap.set(
  "n",
  "<leader>tn",
  function()
    run_nearest()
  end
)
