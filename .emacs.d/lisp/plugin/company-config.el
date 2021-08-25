(require 'company)
(require 'company-quickhelp)
(require 'company-flx)

(setq company-tooltip-align-annotations t)
(setq company-minimum-prefix-length 1)
(company-quickhelp-mode)
(company-flx-mode +1)

(global-set-key (kbd "C-.") 'company-complete)

(add-hook 'after-init-hook 'global-company-mode)
