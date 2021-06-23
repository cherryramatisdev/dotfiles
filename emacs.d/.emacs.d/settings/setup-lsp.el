(require 'eglot)

(add-to-list 'eglot-server-programs '(web-mode . ("tsserver" "--stdio")))

(add-hook 'web-mode-hook 'eglot-ensure)
(add-hook 'typescript-mode-hook 'eglot-ensure)

(global-set-key (kbd "C-c l a") 'eglot-code-actions)
(global-set-key (kbd "C-c l o") 'eglot-code-action-organize-imports)
(global-set-key (kbd "C-c l r") 'eglot-rename)

(provide 'setup-lsp)
