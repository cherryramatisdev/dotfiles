;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH_________________________________________________________________
(when (fboundp 'eww)
  (defun cherry:rename-eww-buffer ()
    "Rename `eww-mode' buffer so sites open in new page.
URL `http://ergoemacs.org/emacs/emacs_eww_web_browser.html'"
    (let (($title (plist-get eww-data :title)))
      (when (eq major-mode 'eww-mode)
	(if $title
	    (rename-buffer (concat "eww" $title) t)
	  (rename-buffer "eww" t)))))
  (add-hook 'eww-after-render-hook 'cherry:rename-eww-buffer))

(provide 'eww-config)
