-- local ok, t = pcall(require, "toggleterm")

-- if not ok then
--   return
-- end

-- t.setup {
--   size = function(term)
--     if term.direction == "horizontal" then
--       return 15
--     elseif term.direction == "vertical" then
--       return vim.o.columns * 0.4
--     end
--   end,
--   open_mapping = [[<c-t>]],
--   hide_numbers = true,
--   shade_terminals = true,
--   start_in_insert = true,
--   insert_mappings = true,
--   persist_size = true,
--   direction = "vertical",
--   close_on_exit = true,
-- }

-- -- TODO: move this to lua
-- vim.cmd [[nnoremap <silent><c-t> <Cmd>exe v:count1 . "ToggleTerm"<CR>]]
