(require 'eglot)
(require 'elm-mode)

(add-hook 'elm-mode-hook 'eglot-ensure)

(define-key elm-mode-map (kbd "C-c la") 'eglot-code-actions)
(define-key elm-mode-map (kbd "C-c lr") 'eglot-rename)
(define-key elm-mode-map (kbd "C-c lk") 'eldoc)
(define-key elm-mode-map (kbd "M-RET") 'eglot-code-action-quickfix)
