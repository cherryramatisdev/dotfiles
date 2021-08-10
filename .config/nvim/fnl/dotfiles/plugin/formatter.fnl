(module dotfiles.plugin.formatter
  {autoload {nvim aniseed.nvim
             utils dotfiles.utils
             f formatter}})

(f.setup {:logging false
          :filetype {:typescript [(fn [] 
                                    {:exe "./node_modules/prettier/bin-prettier.js" 
                                     :args ["--stdin-filepath" (vim.api.nvim_buf_get_name 0)] 
                                     :stdin true})]
                     :typescriptreact [(fn [] 
                                         {:exe "./node_modules/prettier/bin-prettier.js" 
                                          :args ["--stdin-filepath" (vim.api.nvim_buf_get_name 0)] 
                                          :stdin true})]
                     :rust [(fn []
                              {:exe "rustfmt"
                               :args ["--emit=stdout"]
                               :stdin true})]
                     }})

(utils.map->leader := :Format)

(nvim.ex.augroup :formatter)
(nvim.ex.autocmd_)
(nvim.ex.autocmd :BufWritePost "*ts,*tsx,*rs" "FormatWrite")
(nvim.ex.augroup :END)
