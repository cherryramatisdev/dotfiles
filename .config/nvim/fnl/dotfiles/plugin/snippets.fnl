(module dotfiles.plugin.snippets
  {autoload {nvim aniseed.nvim}})

(nvim.set_keymap :i :<C-l> "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'" {:expr true})
(nvim.set_keymap :s :<C-l> "vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-l>'" {:expr true})

(nvim.set_keymap :i :<Tab> "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'" {:expr true})
(nvim.set_keymap :s :<Tab> "vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'" {:expr true})
(nvim.set_keymap :i :<S-Tab> "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'" {:expr true})
(nvim.set_keymap :s :<S-Tab> "vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'" {:expr true})

(vim.cmd "let g:vsnip_snippet_dir='~/projects/dotfiles/.config/nvim/snippets'")
(vim.cmd "let g:vsnip_filetypes = {}")
(vim.cmd "let g:vsnip_filetypes.javascriptreact = ['javascript']")
(vim.cmd "let g:vsnip_filetypes.typescriptreact = ['typescript']")
