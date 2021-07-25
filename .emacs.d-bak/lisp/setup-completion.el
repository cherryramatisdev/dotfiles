(require 'vertico)
(require 'savehist)
(require 'marginalia)
(require 'orderless)
(require 'company)
(require 'company-quickhelp)

(setq vertico-cycle t)

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

;; Disable ido
(ido-mode -1)

(vertico-mode)

(savehist-mode)

(setq completion-styles '(orderless)
      completion-category-defaults nil
      completion-category-overrides '((file (styles partial-completion))))

(eval-after-load "vertico"
  (progn (setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
         (marginalia-mode)))

(provide 'setup-completion)
