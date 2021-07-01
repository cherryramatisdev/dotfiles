(require 'web-mode)
(require 'company)
(require 'prettier-js)
(require 'zencoding-mode)
(require 'npm-mode)

;; Typescript
(setq typescript-indent-level 2)

(define-derived-mode typescript-tsx-mode typescript-mode "TSX"
  "Major mode for editing TSX files.

Refer to Typescript documentation for syntactic differences between normal and TSX
variants of Typescript.")

(add-to-list 'auto-mode-alist '("\\.tsx?\\'" . typescript-tsx-mode))

(add-hook 'typescript-tsx-mode-hook 'npm-mode)
(add-hook 'typescript-mode-hook 'npm-mode)
(add-hook 'typescript-tsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

;; Expand html as css selector
(define-key typescript-tsx-mode-map (kbd "C-j") 'zencoding-expand-line)
          
(provide 'setup-typescript)
