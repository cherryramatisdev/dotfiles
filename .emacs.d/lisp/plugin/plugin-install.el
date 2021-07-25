(require 'straight)
(defmacro package! (pkg)
  `(straight-use-package ,pkg))

;; MiniBuffer Completion
(package! 'vertico)
(package! 'savehist)
(package! 'marginalia)
(package! 'orderless)

;; Search completion
(package! 'consult)

;; Git client
(package! 'magit)

;; Lsp client
(package! 'lsp-mode)

;; Editing text
(package! 'multiple-cursors)

(provide 'plugin-install)		  
