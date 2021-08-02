(require 'web-mode)
(require 'emmet-mode)

;; Typescript
(setq typescript-indent-level 2)

(define-derived-mode typescript-tsx-mode web-mode "TSX"
  "Major mode for editing TSX files.

Refer to Typescript documentation for syntactic differences between normal and TSX
variants of Typescript.")

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-tsx-mode))

(setq emmet-expand-jsx-className? t)
(add-hook 'typescript-tsx-mode-hook 'emmet-mode)

(provide 'plugin-typescript)
