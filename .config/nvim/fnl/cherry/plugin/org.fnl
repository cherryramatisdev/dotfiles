(module cherry.plugin.org
  {autoload {nvim aniseed.nvim
             org orgmode}})

(org.setup {
            :org_agenda_files ["~/org/*"]
            :org_default_notes_file "~/org/notes.org"})
