(require 'magit)
(require 'forge)

(setq auth-sources '("~/.authinfo"))

(defun cherry:magit-status ()
  "Magit status opens fullscreen."
  (interactive)
  (progn
    (magit-status)
    (delete-other-windows)))

(global-set-key (kbd "C-x g") 'cherry:magit-status)
