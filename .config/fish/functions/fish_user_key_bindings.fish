function fish_user_key_bindings
  fish_vi_key_bindings
  # fish_default_key_bindings

  if test "$fish_key_bindings" = "fish_vi_key_bindings"
    bind -M insert \cn 'nvim'
    bind -M insert \cg 'lazygit'
    bind -M insert \ck 'up-or-search'
    bind -M insert \ce 'accept-autosuggestion'
    bind -M insert \cp 'find-files'
    bind -M insert \ct 'tmux new-session -A -s main'
    bind -M insert \cf 'tmux-sessionizer'
  end
end
