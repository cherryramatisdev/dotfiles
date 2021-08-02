(require 'exec-path-from-shell)

(exec-path-from-shell-initialize)

(setq exec-path (append exec-path '("~/.nvm/versions/node/v16.5.0/bin")))
(provide 'config-variables)
