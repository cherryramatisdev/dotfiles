(module cherry.plugin.colors
  {autoload {nvim aniseed.nvim}
   require-macros [cherry.macros]})

(defn colorscheme-fixes []
  (_: hi :SpellBad :gui=underline)
  (_: hi :SpellLocal :gui=underline)
  (_: hi :SpellRare :gui=underline))

(augroup srcery_colorscheme_fixes
  (autocmd :ColorScheme :srcery (viml->fn colorscheme-fixes)))

(_: colorscheme :srcery)
