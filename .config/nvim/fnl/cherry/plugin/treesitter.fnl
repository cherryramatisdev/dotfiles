(module cherry.plugin.treesitter
  {autoload {nvim aniseed.nvim
             conf nvim-treesitter.configs}})

(conf.setup {:highlight {:enable true}
             :context_commentstring {:enable true}
             :autotag {:enable true}})
