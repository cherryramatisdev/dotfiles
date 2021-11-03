local ok, pkg = pcall(require, "null-ls")
local b = pkg.builtins

if not ok then
  return
end

pkg.config {
  debounce = 150,
  sources = {
    b.formatting.stylua,
    b.formatting.prettierd.with {
      filetypes = {
        "typescriptreact",
        "typescript",
        "javascriptreact",
        "javascript",
      },
    },
  },
}

require("lspconfig")["null-ls"].setup {}
