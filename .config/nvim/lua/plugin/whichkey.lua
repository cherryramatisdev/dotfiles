local ok, which = pcall(require, "which-key")

if not ok then
  return
end

which.setup()
