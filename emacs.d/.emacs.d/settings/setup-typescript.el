(require 'web-mode)
(require 'company)
(require 'prettier-js)
(require 'zencoding-mode)
(require 'npm-mode)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook 'npm-mode)
(add-hook 'typescript-mode-hook 'npm-mode)
(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

;; Expand html as css selector
(define-key web-mode-map (kbd "C-j") 'zencoding-expand-line)
          
(provide 'setup-typescript)
