(module dotfiles.plugin.wiki
  {autoload {nvim aniseed.nvim}})

(set nvim.g.vimwiki_list [{:path "~/projects/dotfiles/wiki" 
                           :syntax "markdown" 
                           :ext ".md"}])

(set nvim.g.vimwiki_key_mappings {:all_maps 1
                                  :global 0
                                  :headers 1
                                  :text_objs 1
                                  :table_format 1
                                  :table_mappings 1
                                  :lists 1
                                  :links 0
                                  :html 0
                                  :mouse 0})
