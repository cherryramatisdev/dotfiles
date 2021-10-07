(module dotfiles.plugin.lspconfig
  {autoload {nvim aniseed.nvim}})

(let [lsp (require :lspconfig)
      linstall (require :lspinstall)]

  (linstall.setup)

  (lsp.tsserver.setup {})
  (lsp.go.setup {})

  (nvim.set_keymap :n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:noremap true})
  (nvim.set_keymap :n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
  (nvim.set_keymap :n :K "<cmd>lua vim.lsp.buf.hover()<CR>" {:noremap true})
  (nvim.set_keymap :n :gi "<cmd>lua vim.lsp.buf.implementation()<CR>" {:noremap true})
  (nvim.set_keymap :n :gR "<cmd>lua vim.lsp.buf.references()<CR>" {:noremap true})
  (nvim.set_keymap :n :<C-k> "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:noremap true})
  (nvim.set_keymap :n :<space>lr "<cmd>lua vim.lsp.buf.rename()<CR>" {:noremap true})
  (nvim.set_keymap :n :<space>la "<cmd>lua vim.lsp.buf.code_action()<CR>" {:noremap true})
  (nvim.set_keymap :n :<space>lf "<cmd>lua vim.lsp.buf.formatting()<CR>" {:noremap true})
  (nvim.set_keymap :n :<space>e "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>" {:noremap true})
  (nvim.set_keymap :n "[d" "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>" {:noremap true})
  (nvim.set_keymap :n "]d" "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>" {:noremap true})
  (nvim.set_keymap :n :<space>Q "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>" {:noremap true})
  )

; ;; TODO: transform this in fennel
; (vim.cmd ":call g:Lsp_config()")
