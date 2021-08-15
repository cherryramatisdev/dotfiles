(require 'lsp-mode)
(require 'lsp-ui)

(setq lsp-keymap-prefix "C-c l")

(add-hook 'web-mode-hook #'lsp-deferred)
(add-hook 'typescript-mode-hook #'lsp-deferred)

(add-hook 'web-mode-hook 'lsp-ui-mode)
(add-hook 'typescript-mode-hook 'lsp-ui-mode)
