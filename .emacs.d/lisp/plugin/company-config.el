(require 'company)
(require 'company-quickhelp)

(setq company-tooltip-align-annotations t)
(company-quickhelp-mode)
(add-hook 'after-init-hook 'global-company-mode)
