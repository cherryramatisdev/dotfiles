local ok, t = pcall(require, "toggleterm")

if not ok then
  return
end

t.setup {
  size = 20,
  open_mapping = [[<c-t>]],
  hide_numbers = true,
  shade_terminals = true,
  start_in_insert = true,
  insert_mappings = true,
  persist_size = true,
  direction = "float",
  close_on_exit = true,
}
