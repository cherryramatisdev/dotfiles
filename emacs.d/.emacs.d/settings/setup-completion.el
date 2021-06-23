(require 'company)

(add-hook 'after-init-hook 'global-company-mode)

;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

(provide 'setup-completion)
