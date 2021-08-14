;; -*- coding: utf-8; lexical-binding: t -*-

(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(defun package! (pkg module)
  "Install package using straight.el and if provided a second argument load that too."
  (interactive)
  (if (not (eq module nil))
      (progn
        (straight-use-package pkg)
        (load (format "~/.emacs.d/lisp/plugin/%s.el" module)))
    (progn
      (straight-use-package pkg))))

(package! 'swiper nil)
(package! 'counsel nil)
(package! 'ivy 'ivy-config)
(package! 'company-quickhelp nil)
(package! 'company 'company-config)
(package! 'magit nil)

(provide 'plugins)
