local ok, pkg = pcall(require, "lualine")

if not ok then
  return
end

pkg.setup()
