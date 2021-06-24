(require 'eglot)

(add-to-list 'eglot-server-programs '(web-mode . ("~/.nvm/versions/node/v16.3.0/bin/typescript-language-server" "--stdio")))

(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)

(global-set-key (kbd "C-c l a") 'eglot-code-actions)
(global-set-key (kbd "C-c l o") 'eglot-code-action-organize-imports)
(global-set-key (kbd "C-c l r") 'eglot-rename)

(provide 'setup-lsp)
