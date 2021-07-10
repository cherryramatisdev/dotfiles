(require 'vertico)
(require 'savehist)
(require 'marginalia)
(require 'orderless)

(setq vertico-cycle t)

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

(provide 'setup-vertico)
