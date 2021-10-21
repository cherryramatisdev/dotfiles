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
(tooltip-mode -1)
(scroll-bar-mode -1)

(electric-pair-mode)
(show-paren-mode)

(setq custom-file (concat user-emacs-directory "custom.el"))
(load custom-file 'noerror)

(setq make-backup-files nil)
(setq auto-save-default nil)
(setq create-lockfiles nil)

(delete-selection-mode 1)

(defun setup-themes (theme)
  (set-frame-font "Jetbrains Mono 20" nil t)
  (setq default-frame-alist '((font . "Jetbrains Mono 20")))
  (load-theme theme t))

(setup-themes 'modus-vivendi)

(use-package vertico
  :straight t
  :custom
  (vertico-cycle t)
  :init (vertico-mode))

(use-package savehist
  :init
  (savehist-mode))

(use-package orderless
  :straight t
  :custom (completion-styles '(orderless)))

(use-package marginalia
  :after vertico
  :straight t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

(use-package consult
  :straight t
  :bind (("C-x b" . consult-buffer)
	 ("C-s" . consult-line))
  :hook (completion-list-mode . consult-preview-at-point-mode)
  :init
  (setq register-preview-delay 0
	register-preview-function #'consult-register-format)
  (advice-add #'register-preview :override #'consult-register-window)
  (advice-add #'completing-read-multiple :override #'consult-completing-read-multiple)
  (setq xref-show-xrefs-function #'consult-xref
	xref-show-definitions-function #'consult-xref)
  :config
  (consult-customize
   consult-theme
   :preview-key '(:debounce 0.2 any)
   consult-ripgrep consult-git-grep consult-grep
   consult-bookmark consult-recent-file consult-xref
   consult--source-file consult--source-project-file consult--source-bookmark
   :preview-key (kbd "M-."))
  (setq consult-narrow-key "<") ;; (kbd "C-+")
  (setq consult-project-root-function
	(lambda ()
	  (when-let (project (project-current))
	    (car (project-roots project))))))

(use-package embark
  :straight t
  :bind (("C-." . embark-act))
  :init
  (setq prefix-help-command #'embark-prefix-help-command)
  :config
  (add-to-list 'display-buffer-alist
	       '("\\`\\*Embark Collect \\(Live\\|Completions\\)\\*"
		 nil
		 (window-parameters (mode-line-format . none)))))

(use-package embark-consult
  :straight t
  :after (embark consult)
  :demand t
  :hook
  (embark-collect-mode . consult-preview-at-point-mode))

(use-package minions
  :straight t
  :config (minions-mode 1))

(use-package mood-line
  :straight t
  :init (mood-line-mode))

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

(defun cherry/smart-kill-buffer ()
  (interactive)
  (if (one-window-p)
      (kill-current-buffer)
    (progn
      (kill-current-buffer)
      (delete-window))))

(use-package bind-key
  :straight t
  :config
  (bind-keys
   ("M-SPC" . hippie-expand)
   ("M-n" . forward-paragraph)
   ("M-p" . backward-paragraph)
   ("C-w" . cherry/delete-word-or-region)
   ("C-x k" . cherry/smart-kill-buffer)
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
   ("C-c I" . (lambda () (interactive) (find-file "~/.emacs.d/Emacs.org")))
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

(use-package which-key
  :straight t
  :init (which-key-mode))

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

  (setq smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 465
	smtpmail-stream-type 'ssl)

  (setq message-send-mail-function 'smtpmail-send-it)

  (bind-key "C-c m" 'mu4e))

(use-package dired-single
  :straight t
  :bind (("C-x C-j" . dired-jump)
	 :map dired-mode-map
	 ("RET" . dired-find-file)
	 ([backspace] . dired-single-up-directory)))

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

   ;; Format better paragraphs
   (add-hook 'org-mode-hook 'turn-on-auto-fill)

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
