(require 'projectile)
(require 'ag)

(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(global-set-key (kbd "C-c p") 'projectile-find-file)
(global-set-key (kbd "C-c /") 'ag-project)
