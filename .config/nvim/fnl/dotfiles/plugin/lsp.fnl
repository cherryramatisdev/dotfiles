(module dotfiles.plugin.lsp
  {autoload {nvim aniseed.nvim
             lsp lspconfig
             utils dotfiles.utils
             saga lspsaga}})

(saga.init_lsp_saga)

(let [lsp (require :lspconfig)]
  (when lsp
    (lsp.tsserver.setup {})
    (lsp.rust_analyzer.setup {})))

(defn- map [from to]
  (utils.map->normal from to {:local? true}))

(defn setup []
  (map :gd "lua vim.lsp.buf.definition()")
  (map :gD "lua vim.lsp.buf.declaration()")
  (map :gR "lua require'lspsaga.provider'.lsp_finder()")
  (map :gi "lua vim.lsp.buf.implementation()")
  (map :K "lua require('lspsaga.hover').render_hover_doc()")
  (map :rn "lua require('lspsaga.rename').rename()")
  (map :ga "lua require('lspsaga.codeaction').code_action()")
  (map :<space>e "lua require'lspsaga.diagnostic'.show_line_diagnostics()")
  (map :<space>q "lua vim.lsp.diagnostic.set_loclist()")
  (map :gh "lua require'lspsaga.provider'.lsp_finder()")
  (map :<c-k> "lua require('lspsaga.signaturehelp').signature_help()")
  (map :<c-n> "lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_next()")
  (map :<c-p> "lua require'lspsaga.diagnostic'.lsp_jump_diagnostic_prev()"))

(nvim.ex.augroup :lspconfig-config)
(nvim.ex.autocmd_)
(nvim.ex.autocmd :FileType :typescript "lua require('dotfiles.plugin.lsp').setup()")
(nvim.ex.autocmd :FileType :typescriptreact "lua require('dotfiles.plugin.lsp').setup()")
(nvim.ex.autocmd :FileType :rust "lua require('dotfiles.plugin.lsp').setup()")
(nvim.ex.augroup :END)
