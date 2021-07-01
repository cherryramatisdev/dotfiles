;; No splash screen please ... jeez
(setq inhibit-startup-message t)

;; Auto pairs
(require 'smartparens)
(smartparens-global-mode)

;; Define font
(add-to-list 'default-frame-alist
             '(font . "DejaVu Sans Mono-17"))

(provide 'general)
