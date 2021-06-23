(require 'web-mode)
(require 'company)
(require 'prettier-js)

(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))

(add-hook 'web-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)
          
(provide 'setup-typescript)
