(module dotfiles.plugin.completion
  {autoload {nvim aniseed.nvim}})

(set nvim.o.completeopt "menu,menuone,noselect")

(let [compe (require :compe)]
  (when compe
    (compe.setup
      {:enabled true
       :autocomplete true
       :debug false
       :min_length 1
       :preselect "enable"
       :throttle_time 80
       :source_timeout 200
       :incomplete_delay 400
       :max_abbr_width 100
       :max_kin_width 100
       :max_menu_width 100
       :documentation true
       :source {:path true
                :buffer true
                :calc true
                :nvim_lsp true
                :nvim_lua true
                :conjure true
                :luasnip true}})))

(nvim.set_keymap :i :<C-j> :<C-n> {:noremap false})
(nvim.set_keymap :i :<C-k> :<C-p> {:noremap false})
(nvim.ex.inoremap "<silent><expr> <C-Space> compe#complete()")
(nvim.ex.inoremap "<silent><expr> <CR> compe#confirm('<CR>')")
(nvim.ex.inoremap "<silent><expr> <C-e> compe#close('<C-e>')")
(nvim.ex.inoremap "<silent><expr> <C-f> compe#scroll({ 'delta': +4 })")
(nvim.ex.inoremap "<silent><expr> <C-d> compe#scroll({ 'delta': -4 })")
