(module dotfiles.plugin.org
  {autoload {org orgmode}})

(org.setup {:org_agenda_files ["~/projects/dotfiles/tasks/todo.org"]
            :org_default_notes_file "~/projects/dotfiles/tasks/todo.org"})
