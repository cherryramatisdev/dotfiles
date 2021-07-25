(require 'project)
(require 'consult)

(setq project-switch-commands
        '((?f "File" project-find-file)
          (?g "Grep" project-find-regexp)
          (?d "Dired" project-dired)
          (?b "Buffer" project-switch-to-buffer)
          ;; (?m "Magit" magit-status-fullscreen)
          (?e "Eshell" project-eshell)))

(global-set-key (kbd "C-c pp") 'project-switch-project)
(global-set-key (kbd "C-c pf") 'project-find-file)
(global-set-key (kbd "C-c ps") 'consult-ripgrep)
(global-set-key (kbd "C-c pd") 'project-dired)
;; (global-set-key (kbd "C-c pg") 'magit-status-fullscreen)
(global-set-key (kbd "C-c pt") 'project-eshell)

(provide 'config-project)
