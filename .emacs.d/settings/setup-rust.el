(require 'rust-mode)

(setq rust-format-on-save t)
(define-key rust-mode-map (kbd "C-c C-c") 'rust-run)

(provide 'setup-rust)
