function fish_user_key_bindings
  fish_vi_key_bindings

  bind -M insert \cn 'nvim'
  bind -M insert \cg 'lazygit'
  bind -M insert \ck 'up-or-search'
  bind -M insert \ce 'accept-autosuggestion'
  bind -M insert \cx\cf 'find-files'
  bind -M insert \cx\ct 'tmux new-session -A -s main'
  bind -M insert \cx\cp 'tmux-sessionizer'
  bind -M insert \cx\ce 'ranger'
end
