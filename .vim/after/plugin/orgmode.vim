if has('nvim')
  lua << EOF
  require('orgmode').setup({
  org_agenda_files = {'~/projects/dotfiles/tasks/todo.org'},
  org_default_notes_file = '~/projects/dotfiles/tasks/todo.org',
  })
EOF
endif
