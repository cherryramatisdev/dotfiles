local Utils = require('cherry.utils')
vim.o.completeopt = "menuone,noselect"

local t = function(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local check_back_space = function()
    local col = vim.fn.col('.') - 1
    if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
        return true
    else
        return false
    end
end

-- Use (s-)tab to:
-- move to prev/next item in completion menuone
-- jump to prev/next snippet's placeholder
_G.next_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-n>"
  elseif check_back_space() then
    return t "<C-j>"
  else
    return vim.fn['compe#complete']()
  end
end

_G.prev_complete = function()
  if vim.fn.pumvisible() == 1 then
    return t "<C-p>"
  else
    return t "<C-k>"
  end
end

vim.api.nvim_set_keymap("i", "<C-j>", "v:lua.next_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-j>", "v:lua.next_complete()", {expr = true})
vim.api.nvim_set_keymap("i", "<C-k>", "v:lua.prev_complete()", {expr = true})
vim.api.nvim_set_keymap("s", "<C-k>", "v:lua.prev_complete()", {expr = true})

Utils.noremap('i', '<C-Space>', 'compe#complete()', { silent = true, expr = true })
Utils.noremap('i', '<C-e>', "compe#close('<C-e>')", { silent = true, expr = true })
Utils.noremap('i', '<C-f>', "compe#scroll({ 'delta': +4 })", { silent = true, expr = true })
Utils.noremap('i', '<C-d>', "compe#scroll({ 'delta': -4 })", { silent = true, expr = true })
Utils.noremap('i', '<C-l>', "compe#confirm('<CR>')", { silent = true, expr = true })
Utils.noremap('i', '<CR>', "v:lua.MUtils.completion_confirm()", { expr = true, noremap = true })

require'compe'.setup {
  enabled = true;
  autocomplete = true;
  debug = false;
  min_length = 1;
  preselect = 'enable';
  throttle_time = 80;
  source_timeout = 200;
  incomplete_delay = 400;
  max_abbr_width = 100;
  max_kind_width = 100;
  max_menu_width = 100;
  documentation = true;

  source = {
    path = true;
    buffer = true;
    calc = true;
    nvim_lsp = true;
    nvim_lua = true;
    snippetSupport=false;
    vsnip = false;
    ultisnips = true;
  };
}
