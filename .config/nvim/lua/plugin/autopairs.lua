local ok, p = pcall(require, "nvim-autopairs")

if not ok then
  return
end

p.setup()
