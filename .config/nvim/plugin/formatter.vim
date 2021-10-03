function g:SetupFormatter()
lua << EOF
require "format".setup {
  ["*"] = {
      {cmd = {"sed -i 's/[ \t]*$//'"}} -- remove trailing whitespace
  },
  typescript = {
      {
          cmd = {"prettier -w"},
      }
  },
  typescriptreact = {
      {
          cmd = {"prettier -w"},
      }
  },
}
EOF
endfunction
