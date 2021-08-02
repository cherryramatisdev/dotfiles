(setq lsp-keymap-prefix "C-c l")
(require 'lsp)

(add-hook 'typescript-tsx-mode-hook 'lsp)
(add-hook 'typescript-mode-hook 'lsp)

(add-hook 'go-mode-hook #'lsp-deferred)

;; Set up before-save hooks to format buffer and add/delete imports.
;; Make sure you don't have other gofmt/goimports hooks enabled.
(defun lsp-go-install-save-hooks ()
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t))

(add-hook 'go-mode-hook #'lsp-go-install-save-hooks)

(provide 'plugin-lsp)
