(require 'web-mode)
(require 'tide)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  ;; (flycheck-mode +1)
  ;; (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1))

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setup-tide-mode))))

(provide 'setup-typescript)
