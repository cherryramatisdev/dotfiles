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

(setq inhibit-startup-message t)

(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(electric-pair-mode)
(show-paren-mode)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq make-backup-file nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(defvar cogent-line-selected-window (frame-selected-window))
(defun cogent-line-set-selected-window (&rest _args)
  (when (not (minibuffer-window-active-p (frame-selected-window)))
    (setq cogent-line-selected-window (frame-selected-window))
    (force-mode-line-update)))
(defun cogent-line-unset-selected-window ()
  (setq cogent-line-selected-window nil)
  (force-mode-line-update))
(add-hook 'window-configuration-change-hook #'cogent-line-set-selected-window)
(add-hook 'focus-in-hook #'cogent-line-set-selected-window)
(add-hook 'focus-out-hook #'cogent-line-unset-selected-window)
(advice-add 'handle-switch-frame :after #'cogent-line-set-selected-window)
(advice-add 'select-window :after #'cogent-line-set-selected-window)
(defun cogent-line-selected-window-active-p ()
  (eq cogent-line-selected-window (selected-window)))

(setq-default mode-line-format
	      (list
	       " "
	       mode-line-misc-info ; for eyebrowse
	       '(:eval (list
			;; the buffer name; the file name as a tool tip
			(propertize " %b" 'face 'font-lock-type-face
				    'help-echo (buffer-file-name))
			(when (buffer-modified-p)
			  (propertize
			   " "
			   'face (if (cogent-line-selected-window-active-p)
				     'cogent-line-modified-face
				   'cogent-line-modified-face-inactive)))
			(when buffer-read-only
			  (propertize
			   ""
			   'face (if (cogent-line-selected-window-active-p)
				     'cogent-line-read-only-face
				   'cogent-line-read-only-face-inactive)))
			" "))
	       '(:eval (when-let (vc vc-mode)
			 (list " "
			       (propertize (substring vc 5)
					   'face 'font-lock-comment-face)
			       " ")))



	       ;; spaces to align right
	       '(:eval (propertize
			" " 'display
			`((space :align-to (- (+ right right-fringe right-margin)
					      ,(+ 3 (string-width mode-name)))))))

	       ;; the current major mode
	       (propertize " %m " 'face 'font-lock-string-face)))

(defun cherry/smart-kill-buffer ()
  (interactive)
  (if (one-window-p)
      (kill-current-buffer)
    (progn
      (kill-current-buffer)
      (delete-window))))

(use-package helm
  :straight t
  :bind (("C-x C-f" . helm-find-files)
	 ("M-x" . helm-M-x)
	 ("C-x k" . cherry/smart-kill-buffer))
  :init (helm-mode 1))

(use-package typescript-mode :straight t)

(use-package web-mode
  :straight t	  
  :config
  (define-derived-mode web-tsx-mode typescript-mode "TSX")
  (setq typescript-indent-level 2)
  (add-to-list 'auto-mode-alist '("\\.tsx?\\'" . web-tsx-mode)))

(use-package prettier-js
  :after (web-mode typescript-mode)
  :straight t
  :hook ((web-tsx-mode . prettier-js-mode)
	 (typescript-mode . prettier-js-mode)))

(use-package tide
  :straight t
  :config
  (defun setup-tide-mode ()
    (interactive)
    (tide-setup)
    (eldoc-mode +1)
    (tide-hl-identifier-mode +1))
  (add-hook 'typescript-mode-hook #'setup-tide-mode)
  (add-hook 'web-tsx-mode #'setup-tide-mode))

(use-package flymake-eslint
  :after bind-key
  :straight t
  :config
  (bind-keys
   ("C-c ! l" . flymake-show-diagnostics-buffer)
   ("C-x n" . flymake-goto-next-error)
   ("C-x p" . flymake-goto-prev-error))
  (add-hook 'web-tsx-mode-hook (lambda () (flymake-eslint-enable)))
  (add-hook 'typescript-mode-hook (lambda () (flymake-eslint-enable))))

(use-package tree-sitter :straight t)
(use-package tree-sitter-langs
  :straight t	     
  :after tree-sitter
  :config
  (tree-sitter-require 'tsx)
  (add-to-list 'tree-sitter-major-mode-language-alist '(web-tsx-mode . tsx))
  (add-hook 'web-tsx-mode-hook 'tree-sitter-hl-mode)
  (add-hook 'typescript-mode 'tree-sitter-hl-mode))

(use-package doom-themes
  :straight t
  :config
  (defun setup-themes (theme)
    (set-frame-font "Iosevka 20" nil t)
    (setq default-frame-alist '((font . "Iosevka 20")))
    (load-theme theme t))

  (setq doom-themes-enable-bold t
	doom-themes-enable-italic t)

  (setup-themes 'doom-one))

(use-package company-mode
  :straight t    
  :hook (after-init . global-company-mode))

(use-package company-box
  :straight t
  :hook (company-mode . company-box-mode))

(use-package paredit
  :straight t
  :config
  (add-hook 'emacs-lisp-mode-hook 'paredit-mode))

(defun cherry/delete-word-or-region ()
  (interactive)
  (if (region-active-p)
      (call-interactively #'kill-region) ;; then
    (backward-kill-word 1)))

(use-package bind-key
  :straight t
  :config
  (bind-keys
   ("M-SPC" . hippie-expand)
   ("M-n" . forward-paragraph)
   ("M-p" . backward-paragraph)
   ("C-w" . cherry/delete-word-or-region)
   ("s-c" . delete-frame)
   ("C-h" . delete-backward-char)))

(use-package crux
  :after bind-key
  :straight t
  :config
  (bind-keys
   ("C-u" . crux-kill-whole-line)
   ("C-c k" . crux-kill-other-buffers)
   ("C-c d" . crux-duplicate-current-line-or-region)
   ("C-c I" . crux-find-user-init-file)
   ("ESC c" . (lambda () (interactive) (find-file "~/.emacs.d/Emacs.org")))
   ("C-o" . crux-smart-open-line)
   ("C-c t" . nil)
   ("C-c tn" . crux-visit-term-buffer)
   ("s-j" . crux-top-join-line)))

(use-package multiple-cursors
  :straight t
  :config
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this))

(use-package expand-region
  :straight t
  :config
  (global-set-key (kbd "C-=") 'er/expand-region))

(use-package projectile
  :straight t
  :config
  (projectile-mode +1)
  (define-key projectile-mode-map (kbd "C-x p") 'projectile-command-map))

(use-package which-key
  :straight t
  :init (which-key-mode))

(use-package magit
  :after bind-key
  :straight t
  :config
  (defun magit-fullscreen ()
    (interactive)
    (magit-status)
    (delete-other-windows))
  (bind-key "C-x g" 'magit-fullscreen))

(use-package bufler
  :after bind-key
  :straight t
  :config (bind-key "C-x C-b" 'bufler))

(use-package org-roam
  :straight t
  :after org
  :init (setq org-roam-v2-ack t) ;; Acknowledge V2 upgrade
  :custom
  (org-roam-directory (file-truename org-directory))
  :config
  (org-roam-setup)
  :bind (("C-c n f" . org-roam-node-find)
	 ("C-c n g" . org-roam-graph)
	 ("C-c n r" . org-roam-node-random)    
	 ("C-c n c" . org-roam-capture)
	 (:map org-mode-map
	       (("C-c n i" . org-roam-node-insert)
		("C-c n o" . org-id-get-create)
		("C-c n t" . org-roam-tag-add)
		("C-c n a" . org-roam-alias-add)
		("C-c n l" . org-roam-buffer-toggle)))))

(use-package org-download :straight t)

(use-package lua-mode :straight t)

(use-package mu4e
  :after bind-key
  :ensure nil
  :load-path "/usr/share/emacs/site-lisp/mu4e/"
  :config
  ;; this is set to 't' to avoid mail syncing issues when using mbsync
  (setq mu4e-change-filenames-when-moving t)

  ;; Refresh mail using isync every 10 minutes
  (setq mu4e-update-interval (* 10 60))
  (setq mu4e-get-mail-command "mbsync -a")
  (setq mu4e-maildir "~/Mail")

  (setq mu4e-drafts-folder "/[Gmail].Drafts")
  (setq mu4e-sent-folder "/[Gmail].Sent Mail")
  (setq mu4e-refile-folder "/[Gmail].All Mail")
  (setq mu4e-trash-folder "/[Gmail].Trash")

  (setq mu4e-maildir-shortcuts
	'(("/Inbox" . ?i)
	  ("/[Gmail].Sent Mail" . ?s)
	  ("/[Gmail].Trash" . ?t)
	  ("/[Gmail].Drafts" . ?d)
	  ("/[Gmail] All Mail" . ?a)))
  (bind-key "C-c m" 'mu4e))

(use-package bongo
  :after bind-key
  :straight t
  :config
  (setq bongo-default-directory "~/Music")
  (setq bongo-prefer-library-buffers nil)
  (setq bongo-insert-whole-directory-trees t)
  (setq bongo-logo nil)
  (setq bongo-display-track-icons nil)
  (setq bongo-display-header-icons nil)
  (setq bongo-display-playback-mode-indicator t)
  (setq bongo-display-join-inserted-tracks nil)
  (setq bongo-field-separator (propertize " . " 'face 'shadow))
  (setq bongo-mark-played-tracks t)
  (setq bongo-header-line-mode nil)
  (setq bongo-mode-line-indicator-mode nil)
  (setq bongo-enabled-backends '(vlc mpv))
  (setq bongo-vlc-program-name "cvlc")

  (bind-key "C-c p" 'bongo-playlist))

(use-package emmet-mode
  :straight t
  :hook ((web-tsx-mode . emmet-mode))
  :config
  (add-to-list 'emmet-jsx-major-modes 'web-tsx-mode))

(use-package org
  :after bind-key
  :config
  (setq org-ellipsis " ▾")

  (setq org-agenda-start-with-log-mode t)
  (setq org-log-done 'time)
  (setq org-log-into-drawer t)

  (setq org-directory (concat (getenv "HOME") "/projects/dotfiles/wiki"))
  (setq org-agenda-files '("~/projects/dotfiles/tasks/todo.org"))
  (setq org-agenda-skip-function-global '(org-agenda-skip-entry-if 'todo 'done))

   (setq org-capture-templates
	 `(("t" "Task")
	   ("tp" "Task Personal" entry (file+olp "~/projects/dotfiles/tasks/todo.org" "Inbox - Personal")
	    "* TODO %?\n SCHEDULED: %^t\n %a\n  %i" :empty-lines 0)
	   ("tw" "Task Work" entry (file+olp "~/projects/dotfiles/tasks/todo.org" "Inbox - Work")
	    "* TODO %?\n SCHEDULED: %^t\n %a\n  %i" :empty-lines 0)))
   (bind-key "C-c c" 'org-capture)
   (bind-key "C-c a " 'org-agenda))

(setq explicit-shell-file-name "/usr/bin/fish")

(defun cherry/term-exec-hook ()
  (let* ((buff (current-buffer))
	 (proc (get-buffer-process buff)))
    (set-process-sentinel
     proc
     `(lambda (process event)
	(if (string= event "finished\n")
	    (progn
	      (kill-buffer ,buff)
	      (delete-window)))))))

(add-hook 'term-exec-hook 'cherry/term-exec-hook)

(eval-after-load "term"
  '(define-key term-raw-map (kbd "C-y") 'term-paste))

(defun my-create-non-existent-directory ()
  (let ((parent-directory (file-name-directory buffer-file-name)))
    (when (and (not (file-exists-p parent-directory))
	       (y-or-n-p (format "Directory `%s' does not exist! Create it?" parent-directory)))
      (make-directory parent-directory t))))

(add-to-list 'find-file-not-found-functions 'my-create-non-existent-directory)
