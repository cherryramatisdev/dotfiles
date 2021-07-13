(add-hook 'python-mode-hook (lambda () (require 'lsp-pyright)
                              (lsp)))

(require 'highlight-indent-guides)

(setq highlight-indent-guides-method 'character)

(add-hook 'python-mode-hook 'highlight-indent-guides-mode)

(provide 'setup-python)
