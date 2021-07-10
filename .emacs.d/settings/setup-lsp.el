(setq lsp-keymap-prefix "C-c l")

(require 'lsp)

(add-hook 'web-mode-hook 'lsp)
(add-hook 'typescript-mode-hook 'lsp)
(add-hook 'rust-mode-hook 'lsp)

(global-set-key (kbd "M-RET") 'lsp-execute-code-action)
(global-set-key (kbd "C-c lo") 'lsp-organize-imports)

(provide 'setup-lsp)
