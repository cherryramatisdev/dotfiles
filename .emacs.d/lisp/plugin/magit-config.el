(require 'magit)

(defun cherry:magit-status ()
  "Magit status opens fullscreen."
  (interactive)
  (progn
    (magit-status)
    (delete-other-windows)))
