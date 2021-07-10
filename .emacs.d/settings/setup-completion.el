(require 'company)
(require 'company-quickhelp)

(company-quickhelp-mode)

(setq tab-always-indent 'complete)
(add-to-list 'completion-styles 'initials t)

(add-hook 'after-init-hook 'global-company-mode)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(global-set-key (kbd "C-,") 'company-complete)

(provide 'setup-completion)
