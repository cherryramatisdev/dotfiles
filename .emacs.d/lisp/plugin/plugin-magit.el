(require 'magit)

(defun cherry/git-status ()
  (interactive)
  (magit-status)
  (delete-other-windows))

;; Git status
(global-set-key (kbd "C-x g") 'cherry/git-status)

(provide 'plugin-magit)
