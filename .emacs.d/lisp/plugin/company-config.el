(require 'company)
(require 'company-quickhelp)
(require 'company-flx)

(setq company-tooltip-align-annotations t)
(company-quickhelp-mode)
(company-flx-mode +1)

(add-hook 'after-init-hook 'global-company-mode)
