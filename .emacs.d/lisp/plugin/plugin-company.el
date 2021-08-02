(require 'company)
(require 'company-quickhelp)

;; TAB cycle if there are only few candidates
(setq completion-cycle-threshold 3)

;; Enable indentation+completion using the TAB key.
;; `completion-at-point' is often bound to M-TAB.
(setq tab-always-indent 'complete)

(setq company-idle-delay 0.1
      company-minimum-prefix-length 1)

(global-company-mode)
(company-quickhelp-mode)

(global-set-key (kbd "C-,") 'company-complete)

(provide 'plugin-company)
