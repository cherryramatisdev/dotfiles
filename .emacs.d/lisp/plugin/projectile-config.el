(require 'projectile)

(projectile-mode +1)

(define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map)
(global-set-key (kbd "C-c p") 'projectile-find-file)
