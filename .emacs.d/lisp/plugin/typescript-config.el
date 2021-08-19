(require 'flycheck)
(require 'tide)

(defun setup-tide-mode ()
  "Setup tide enabling flycheck and tide stuff"
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(global-set-key (kbd "C-c la") 'tide-refactor)
(global-set-key (kbd "C-c lr") 'tide-rename-symbol)
(global-set-key (kbd "C-c lk") 'tide-documentation-at-point)
