(require 'format-all)
(require 'web-mode)
(require 'typescript-mode)

(add-hook 'web-mode-hook 'format-all-mode)
(add-hook 'typescript-mode-hook 'format-all-mode)

(global-set-key (kbd "C-c =") 'format-all-buffer)
