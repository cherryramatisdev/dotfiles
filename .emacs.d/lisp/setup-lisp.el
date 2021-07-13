(require 'paredit)

(add-hook 'emacs-lisp-mode-hook 'paredit-mode)

(define-key paredit-mode-map (kbd "M-]") 'paredit-forward-slurp-sexp)
(define-key paredit-mode-map (kbd "M-[") 'paredit-backward-barf-sexp)

(provide 'setup-lisp)
