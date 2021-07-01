(module cherry.plugin.autopairs
  {autoload {nvim aniseed.nvim
             autopairs nvim-autopairs
             compe-pairs nvim-autopairs.completion.compe}})

(autopairs.setup {})
(compe-pairs.setup {:map_cr true
                    :map_complete true})
