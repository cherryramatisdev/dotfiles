(require 'bufler)

(defun cherry:open-bufler ()
  "Open bufler fullscreen."
  (interactive)
  (progn
    (bufler-list)
    (delete-other-windows)))

(global-set-key (kbd "C-x C-b") 'cherry:open-bufler)
