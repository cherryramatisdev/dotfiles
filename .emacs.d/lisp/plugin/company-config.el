(require 'company)
(require 'company-quickhelp)

(company-quickhelp-mode)
(add-hook 'after-init-hook 'global-company-mode)
