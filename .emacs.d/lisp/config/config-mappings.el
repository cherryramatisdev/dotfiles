(require 'cherry-editing)

(global-set-key (kbd "C-o") 'cherry/open-line-below)
(global-set-key (kbd "C-S-o") 'cherry/open-line-above)
(global-set-key (kbd "C-c d") 'cherry/duplicate-line)

;; Text search completion
(global-set-key (kbd "C-s") 'consult-line)

;; Git status
(global-set-key (kbd "C-x g") 'cherry/git-status)

;; Multiple cursors
(require 'multiple-cursors)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(provide 'config-mappings)
