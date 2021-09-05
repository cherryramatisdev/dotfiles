(require 'flycheck)
(require 'tide)
(require 'npm-mode)

(defun setup-tide-mode ()
  "Setup tide enabling flycheck and tide stuff"
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'typescript-mode-hook 'npm-mode)
(add-hook 'web-mode-hook 'npm-mode)
(add-hook 'web-mode-hook #'setup-tide-mode)

(define-key typescript-mode-map (kbd "C-c la") 'tide-refactor)
(define-key typescript-mode-map (kbd "C-c lr") 'tide-rename-symbol)
(define-key typescript-mode-map (kbd "C-c lk") 'tide-documentation-at-point)
(define-key typescript-mode-map (kbd "M-RET") 'tide-fix)

(define-key web-mode-map (kbd "C-c la") 'tide-refactor)
(define-key web-mode-map (kbd "C-c lr") 'tide-rename-symbol)
(define-key web-mode-map (kbd "C-c lk") 'tide-documentation-at-point)
(define-key web-mode-map (kbd "M-RET") 'tide-fix)
