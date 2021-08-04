require('formatter.util').print = function() end

require('formatter').setup({
  logging = false,
  filetype = {
    typescript = {
        -- prettier
       function()
          return {
            exe = "./node_modules/prettier/bin-prettier.js",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true,
          }
        end
    },
    typescriptreact = {
        -- prettier
       function()
          return {
            exe = "prettier",
            args = {"--stdin-filepath", vim.api.nvim_buf_get_name(0)},
            stdin = true
          }
        end
    },
    rust = {
      -- Rustfmt
      function()
        return {
          exe = "rustfmt",
          args = {"--emit=stdout"},
          stdin = true
        }
      end
    },
  }
})
