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

(straight-use-package 'use-package)

(use-package better-defaults
  :straight t)

(use-package smex
  :straight t
  :bind (("M-x" . smex))
  :config
  (smex-initialize))

(global-set-key (kbd "C-x C-c") 'compile)
(global-set-key (kbd "C-x C-r") 'recompile)

(global-set-key (kbd "C-x rq") 'save-buffers-kill-terminal)
