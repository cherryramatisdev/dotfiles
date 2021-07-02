(module cherry.plugin.lsp
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             saga lspsaga}})

(lsp.tsserver.setup {})

(nvim.set_keymap :n :gH "<cmd>lua require'lspsaga.provider'.lsp_finder()<CR>" {:noremap true})
(nvim.set_keymap :n :ga "<cmd>lua require'lspsaga.codeaction'.code_action()<CR>" {:noremap true})
(nvim.set_keymap :v :ga ":<C-U>lua require'lspsaga.codeaction'.range_code_action()<CR>" {:noremap true})
(nvim.set_keymap :n :K "<cmd>lua require'lspsaga.hover'.render_hover_doc()<CR>" {:noremap true})
(nvim.set_keymap :n :gs "<cmd>lua require'lspsaga.signaturehelp'.signature_help()<CR>" {:noremap true})
(nvim.set_keymap :n :rn "<cmd>lua require'lspsaga.rename'.rename()<CR>" {:noremap true})
(nvim.set_keymap :n :<leader>cd "<cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>" {:noremap true})
(nvim.set_keymap :n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:noremap true})
