(require 'magit)

(defun cherry/disable (feature)
  (cond
   ((equal feature "menu") (menu-bar-mode -1))
   ((equal feature "scroll") (scroll-bar-mode -1))
   ((equal feature "tool") (tool-bar-mode -1))
   )
  )

(defun cherry/git-status ()
  (interactive)
  (magit-status)
  (delete-other-windows))

(provide 'cherry-utils)
