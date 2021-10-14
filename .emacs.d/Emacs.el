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

  (setq smtpmail-smtp-server "smtp.gmail.com"
	smtpmail-smtp-service 465
	smtpmail-stream-type 'ssl)

  (setq message-send-mail-function 'smtpmail-send-it)

  (bind-key "C-c m" 'mu4e))

(use-package bongo
  :straight t
  :config
  (setq bongo-default-directory "~/Music")
  (setq bongo-prefer-library-buffers nil)
  (setq bongo-insert-whole-directory-trees t)
  (setq bongo-logo nil)
  (setq bongo-display-track-icons nil)
  (setq bongo-display-track-lengths nil)
  (setq bongo-display-header-icons nil)
  (setq bongo-display-playback-mode-indicator t)
  (setq bongo-display-inline-playback-progress t)
  (setq bongo-join-inserted-tracks nil)
  (setq bongo-field-separator (propertize " · " 'face 'shadow))
  (setq bongo-mark-played-tracks t)
  (setq bongo-header-line-mode nil)
  (setq bongo-mode-line-indicator-mode nil)
  (setq bongo-enabled-backends '(vlc mpv))
  (setq bongo-vlc-program-name "cvlc")

;;; Bongo playlist buffer
  (defvar prot/bongo-playlist-delimiter
    "\n******************************\n\n"
    "Delimiter for inserted items in `bongo' playlist buffers.")

  (defun prot/bongo-playlist-section ()
    (bongo-insert-comment-text
     prot/bongo-playlist-delimiter))

  (defun prot/bongo-paylist-section-next ()
    "Move to next `bongo' playlist custom section delimiter."
    (interactive)
    (let ((section "^\\*+$"))
      (if (save-excursion (re-search-forward section nil t))
	  (progn
	    (goto-char (point-at-eol))
	    (re-search-forward section nil t))
	(goto-char (point-max)))))

  (defun prot/bongo-paylist-section-previous ()
    "Move to previous `bongo' playlist custom section delimiter."
    (interactive)
    (let ((section "^\\*+$"))
      (if (save-excursion (re-search-backward section nil t))
	  (progn
	    (goto-char (point-at-bol))
	    (re-search-backward section nil t))
	(goto-char (point-min)))))

  (defun prot/bongo-playlist-mark-section ()
    "Mark `bongo' playlist section, delimited by custom markers.
The marker is `prot/bongo-playlist-delimiter'."
    (interactive)
    (let ((section "^\\*+$"))
      (search-forward-regexp section nil t)
      (push-mark nil t)
      (forward-line -1)
      ;; REVIEW any predicate to replace this `save-excursion'?
      (if (save-excursion (re-search-backward section nil t))
	  (progn
	    (search-backward-regexp section nil t)
	    (forward-line 1))
	(goto-char (point-min)))
      (activate-mark)))

  (defun prot/bongo-playlist-kill-section ()
    "Kill `bongo' playlist-section at point.
This operates on a custom delimited section of the buffer.  See
`prot/bongo-playlist-kill-section'."
    (interactive)
    (prot/bongo-playlist-mark-section)
    (bongo-kill))

  (defun prot/bongo-playlist-play-random ()
    "Play random `bongo' track and determine further conditions."
    (interactive)
    (unless (bongo-playlist-buffer)
      (bongo-playlist-buffer))
    (when (or (bongo-playlist-buffer-p)
	      (bongo-library-buffer-p))
      (unless (bongo-playing-p)
	(with-current-buffer (bongo-playlist-buffer)
	  (bongo-play-random)
	  (bongo-random-playback-mode 1)
	  (bongo-recenter)))))

  (defun prot/bongo-playlist-random-toggle ()
    "Toggle `bongo-random-playback-mode' in playlist buffers."
    (interactive)
    (if (eq bongo-next-action 'bongo-play-random-or-stop)
	(bongo-progressive-playback-mode)
      (bongo-random-playback-mode)))

  (defun prot/bongo-playlist-reset ()
    "Stop playback and reset `bongo' playlist marks.
To reset the playlist is to undo the marks produced by non-nil
`bongo-mark-played-tracks'."
    (interactive)
    (when (bongo-playlist-buffer-p)
      (bongo-stop)
      (bongo-reset-playlist)))

  (defun prot/bongo-playlist-terminate ()
    "Stop playback and clear the entire `bongo' playlist buffer.
Contrary to the standard `bongo-erase-buffer', this also removes
the currently-playing track."
    (interactive)
    (when (bongo-playlist-buffer-p)
      (bongo-stop)
      (bongo-erase-buffer)))

  (defun prot/bongo-playlist-insert-playlist-file ()
    "Insert contents of playlist file to a `bongo' playlist.
Upon insertion, playback starts immediately, in accordance with
`prot/bongo-play-random'.

The available options at the completion prompt point to files
that hold filesystem paths of media items.  Think of them as
'directories of directories' that mix manually selected media
items.

Also see `prot/bongo-dired-make-playlist-file'."
    (interactive)
    (let* ((path "~/Music/playlists/")
	   (dotless directory-files-no-dot-files-regexp)
	   (playlists (mapcar
		       'abbreviate-file-name
		       (directory-files path nil dotless)))
	   (choice (completing-read "Insert playlist: " playlists nil t)))
      (if (bongo-playlist-buffer-p)
	  (progn
	    (save-excursion
	      (goto-char (point-max))
	      (bongo-insert-playlist-contents
	       (format "%s%s" path choice))
	      (prot/bongo-playlist-section))
	    (prot/bongo-playlist-play-random))
	(user-error "Not in a `bongo' playlist buffer"))))

;;; Bongo + Dired (bongo library buffer)
  (defmacro prot/bongo-dired-library (name doc val)
    "Create `bongo' library function NAME with DOC and VAL."
    `(defun ,name ()
       ,doc
       (when (string-match-p "\\`~/Music/" default-directory)
	 (bongo-dired-library-mode ,val))))

  (prot/bongo-dired-library
   prot/bongo-dired-library-enable
   "Set `bongo-dired-library-mode' when accessing ~/Music.

Add this to `dired-mode-hook'.  Upon activation, the directory
and all its sub-directories become a valid library buffer for
Bongo, from where we can, among others, add tracks to playlists.
The added benefit is that Dired will continue to behave as
normal, making this a superior alternative to a purpose-specific
library buffer.

Note, though, that this will interfere with `wdired-mode'.  See
`prot/bongo-dired-library-disable'."
   1)

  ;; NOTE `prot/bongo-dired-library-enable' does not get reactivated
  ;; upon exiting `wdired-mode'.
  ;;
  ;; TODO reactivate bongo dired library upon wdired exit
  (prot/bongo-dired-library
   prot/bongo-dired-library-disable
   "Unset `bongo-dired-library-mode' when accessing ~/Music.
This should be added `wdired-mode-hook'.  For more, refer to
`prot/bongo-dired-library-enable'."
   -1)

  (defun prot/bongo-dired-insert-files ()
    "Add files in a `dired' buffer to the `bongo' playlist."
    (let ((media (dired-get-marked-files)))
      (with-current-buffer (bongo-playlist-buffer)
	(goto-char (point-max))
	(mapc 'bongo-insert-file media)
	(prot/bongo-playlist-section))
      (with-current-buffer (bongo-library-buffer)
	(dired-next-line 1))))

  (defun prot/bongo-dired-insert ()
    "Add `dired' item at point or marks to `bongo' playlist.

The playlist is created, if necessary, while some other tweaks
are introduced.  See `prot/bongo-dired-insert-files' as well as
`prot/bongo-playlist-play-random'.

Meant to work while inside a `dired' buffer that doubles as a
library buffer (see `prot/bongo-dired-library')."
    (interactive)
    (when (bongo-library-buffer-p)
      (unless (bongo-playlist-buffer-p)
	(bongo-playlist-buffer))
      (prot/bongo-dired-insert-files)
      (prot/bongo-playlist-play-random)))

  (defun prot/bongo-dired-make-playlist-file ()
    "Add `dired' marked items to playlist file using completion.

These files are meant to reference filesystem paths.  They ease
the task of playing media from closely related directory trees,
without having to interfere with the user's directory
structure (e.g. a playlist file 'rock' can include the paths of
~/Music/Scorpions and ~/Music/Queen).

This works by appending the absolute filesystem path of each item
to the selected playlist file.  If no marks are available, the
item at point will be used instead.

Selecting a non-existent file at the prompt will create a new
entry whose name matches user input.  Depending on the completion
framework, such as with `icomplete-mode', this may require a
forced exit (e.g. \\[exit-minibuffer] to parse the input without
further questions).

Also see `prot/bongo-playlist-insert-playlist-file'."
    (interactive)
    (let* ((dotless directory-files-no-dot-files-regexp)
	   (pldir "~/Music/playlists")
	   (playlists (mapcar
		       'abbreviate-file-name
		       (directory-files pldir nil dotless)))
	   (plname (completing-read "Select playlist: " playlists nil nil))
	   (plfile (format "%s/%s" pldir plname))
	   (media-paths
	    (if (derived-mode-p 'dired-mode)
		;; TODO more efficient way to do ensure newline ending?
		;;
		;; The issue is that we need to have a newline at the
		;; end of the file, so that when we append again we
		;; start on an empty line.
		(concat
		 (mapconcat #'identity
			    (dired-get-marked-files)
			    "\n")
		 "\n")
	      (user-error "Not in a `dired' buffer"))))
      ;; The following `when' just checks for an empty string.  If we
      ;; wanted to make this more robust we should also check for names
      ;; that contain only spaces and/or invalid characters…  This is
      ;; good enough for me.
      (when (string-empty-p plname)
	(user-error "No playlist file has been specified"))
      (unless (file-directory-p pldir)
	(make-directory pldir))
      (unless (and (file-exists-p plfile)
		   (file-readable-p plfile)
		   (not (file-directory-p plfile)))
	(make-empty-file plfile))
      (append-to-file media-paths nil plfile)
      (with-current-buffer (find-file-noselect plfile)
	(delete-duplicate-lines (point-min) (point-max))
	(sort-lines nil (point-min) (point-max))
	(save-buffer)
	(kill-buffer))))

  :hook ((dired-mode-hook . prot/bongo-dired-library-enable)
	 (wdired-mode-hook . prot/bongo-dired-library-disable))
  :bind (("C-c p" . nil)
	 ("C-c M-p" . bongo-pause/resume)
	 ("C-c pn" . bongo-next)
	 ("C-c pP" . bongo-previous)
	 ("C-c ps" . bongo-show)
	 ("C-c pf" . bongo-seek-forward-10)
	 ("C-c pb" . bongo-seek-backward-10)
	 ("C-c pp" . bongo)
	 :map bongo-playlist-mode-map
	 ("n" . bongo-next-object)
	 ("p" . bongo-previous-object)
	 ("M-n" . prot/bongo-paylist-section-next)
	 ("M-p" . prot/bongo-paylist-section-previous)
	 ("M-h" . prot/bongo-playlist-mark-section)
	 ("M-d" . prot/bongo-playlist-kill-section)
	 ("g" . prot/bongo-playlist-reset)
	 ("D" . prot/bongo-playlist-terminate)
	 ("r" . prot/bongo-playlist-random-toggle)
	 ("R" . bongo-rename-line)
	 ("j" . bongo-dired-line)       ; Jump to dir of file at point
	 ("J" . dired-jump)             ; Jump to library buffer
	 ("i" . prot/bongo-playlist-insert-playlist-file)
	 ("I" . bongo-insert-special)
	 :map bongo-dired-library-mode-map
	 ("<C-return>" . prot/bongo-dired-insert)
	 ("C-c SPC" . prot/bongo-dired-insert)
	 ("C-c +" . prot/bongo-dired-make-playlist-file)))

(use-package emmet-mode
  :straight t
  :hook ((web-tsx-mode . emmet-mode))
  :config
  (add-to-list 'emmet-jsx-major-modes 'web-tsx-mode))

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

(defun cherry/visit-pull-request-url ()
  "Visit the current branch's PR on Github."
  (interactive)
  (browse-url
   (format "https://github.com/%s/pull/new/%s"
	   (replace-regexp-in-string
	    "\\`.+github\\.com:\\(.+\\)\\.git\\'" "\\1"
	    (magit-get "remote"
		       (magit-get-push-remote)
		       "url"))
	   (magit-get-current-branch))))

(eval-after-load 'magit
  '(define-key magit-mode-map "v" #'cherry/visit-pull-request-url))
