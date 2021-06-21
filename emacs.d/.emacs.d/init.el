;; Set up package.el to work with MELPA
(require 'package)
(setq package-archives
      '(("melpa" . "https://melpa.org/packages/")
	("org" . "https://orgmode.org/elpa/")
	("elpa" . "https://elpa.gnu.org/packages/")))

(package-initialize)

(setq use-package-always-ensure t)
(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(defmacro key! (key func)
  `(evil-define-key 'normal 'global (kbd ,key) ,func))

(defvar hexcolour-keywords
  '(("#[abcdef[:digit:]]\\{6\\}"
     (0 (put-text-property (match-beginning 0)
			   (match-end 0)
			   'face (list :background
				       (match-string-no-properties 0)))))))

(defun hexcolour-add-to-font-lock ()
  (font-lock-add-keywords nil hexcolour-keywords))
(add-hook 'evil-mode-hook 'hexcolour-add-to-font-lock)

(show-paren-mode 1)

;; Relative line numbers -------------------------------------------------------
(defvar my-linum-current-line-number (line-number-at-pos))

(setq linum-format 'my-linum-relative-line-numbers)

(defun my-linum-relative-line-numbers (line-number)
  (let ((test2 (- line-number my-linum-current-line-number)))
    (propertize
     (number-to-string (cond ((<= test2 0) (* -1 test2))
			     ((> test2 0) test2)))
     'face 'linum)))

(defadvice linum-update (around my-linum-update)
  (let ((my-linum-current-line-number (line-number-at-pos)))
    ad-do-it))
(ad-activate 'linum-update)

(global-linum-mode t)

;; Relative line numbers END --------------------------------------------------

;; Fix copy on tty
(use-package clipetty
  :ensure t
  :hook (after-init . global-clipetty-mode))

;; Evil mode settings
(progn
  ;; vim like scrolling
  (setq scroll-step           1
	scroll-conservatively 10000)

  ;; Vim style undo
  (use-package undo-fu)

  (use-package evil
    :init
    (setq evil-evil-want-Y-yank-to-eol t)
    (setq evil-want-C-u-scroll t)
    (setq evil-want-keybinding nil)
    (setq evil-split-window-below t)
    (setq evil-split-window-right t)
    (setq evil-undo-system 'undo-fu)
    :config
    (evil-mode 1)
    (evil-set-leader 'normal " ")
    (key! ";" 'evil-ex)
    (key! "gl" 'end-of-line)
    (key! "gh" 'evil-first-non-blank)
    (key! "Y" "y$")
    (key! "<leader> ." 'counsel-find-file)
    (key! "<leader> fs" 'save-buffer)
    (key! "<leader> ws" 'split-window-below)
    (key! "<leader> wv" 'split-window-right)
    (key! "<leader> wo" 'delete-other-windows)
    (key! "<leader> qq" 'save-buffers-kill-terminal)
    (key! "<leader> bd" 'kill-current-buffer)
    (key! "<leader> wd" 'delete-window)
    (key! "<leader> ee" 'eval-last-sexp)
    (key! "<leader> h" 'windmove-left)
    (key! "<leader> j" 'windmove-down)
    (key! "<leader> k" 'windmove-up)
    (key! "<leader> l" 'windmove-right)
    (global-set-key (kbd "<escape>") 'keyboard-escape-quit))

  ;; Evil bindings on org mode
  (use-package evil-org
    :after org
    :hook (org-mode . (lambda () evil-org-mode))
    :config
    (require 'evil-org-agenda)
    (evil-org-agenda-set-keys))

  ;; Evil visual highlight on yank
  (use-package evil-goggles
    :init (evil-goggles-mode))

  ;; Evil mode in other modes
  (use-package evil-collection
    :config
    (evil-collection-init))

  ;; commentary
  (use-package evil-commentary
    :config
    (evil-commentary-mode 1))

  ;; surround
  (use-package evil-surround
    :config
    (global-evil-surround-mode 1)))

(if (not (display-graphic-p))
    (progn (set-face-background 'default "undefined")
	   (add-to-list 'term-file-aliases
			'("st-256color" . "xterm-256color"))))

;; Setup ivy
(use-package ivy
  :bind (("C-s" . swiper)
	 :map ivy-minibuffer-map
	 ("TAB" . ivy-alt-done)
	 ("C-f" . ivy-alt-done)
	 ("C-l" . ivy-alt-done)
	 ("C-j" . ivy-next-line)
	 ("C-k" . ivy-previous-line)
	 :map ivy-switch-buffer-map
	 ("C-k" . ivy-previous-line)
	 ("C-l" . ivy-done)
	 ("C-d" . ivy-switch-buffer-kill)
	 :map ivy-reverse-i-search-map
	 ("C-k" . ivy-previous-line)
	 ("C-d" . ivy-reverse-i-search-kill))
  :config
  (counsel-mode 1)
  (key! "<leader> ss" 'swiper-isearch)
  (key! "<leader> ;" 'counsel-M-x)
  (global-set-key (kbd "M-y") 'counsel-yank-pop)
  (global-set-key (kbd "C-c v") 'ivy-push-view)
  (global-set-key (kbd "C-c V") 'ivy-pop-view))

;; Theme
(use-package badger-theme
  :config
  (load-theme 'badger t)
  (set-cursor-color "#dc322f")
  (set-face-attribute 'region nil :background "#666" :foreground "#ffffff"))

;; (set-frame-parameter (selected-frame) 'alpha '(90 90))
;; (add-to-list 'default-frame-alist '(alpha 90 90))

(use-package org-bullets
  :config
  (if (display-graphic-p)
      (add-hook 'org-mode-hook #'org-bullets-mode)))

;; Make sure org-indent face is available
(require 'org-indent)
(require 'org-tempo)

(setq org-directory "~/org")
(setq org-agenda-files '("~/org/todo.org" "~/org/refile.org"))

(key! "gA" 'org-agenda)
(key! "gC" 'org-capture)

(setq org-default-notes-file (concat org-directory "/refile.org"))
(setq org-log-done 'time)
(setq org-log-into-drawer t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "DOING(n)" "|" "DONE(d!)")
	(sequence "BACKLOG(b)" "REVIEW(v)" "WAIT(w@/!)" "|" "CANC(k@)")))

;; Configure custom agenda views
(setq org-agenda-custom-commands
      '(("d" "Dashboard"
	 ((agenda "" ((org-deadline-warning-days 7)))
	  (todo "NEXT"
		((org-agenda-overriding-header "Next Tasks")))
	  (tags-todo "agenda/ACTIVE" ((org-agenda-overriding-header "Active Projects")))))

    ("n" "Next Tasks"
     ((todo "NEXT"
        ((org-agenda-overriding-header "Next Tasks")))))

    ("W" "Work Tasks" tags-todo "+work")

    ("w" "Workflow Status"
     ((todo "WAIT"
            ((org-agenda-overriding-header "Waiting on External")
             (org-agenda-files org-agenda-files)))
      (todo "TODO"
            ((org-agenda-overriding-header "To Do")
             (org-agenda-files org-agenda-files)))
      (todo "BACKLOG"
            ((org-agenda-overriding-header "Project Backlog")
             (org-agenda-todo-list-sublevels nil)
             (org-agenda-files org-agenda-files)))
      (todo "DOING"
            ((org-agenda-overriding-header "Doing")
             (org-agenda-files org-agenda-files)))
      (todo "DONE"
            ((org-agenda-overriding-header "Completed Projects")
             (org-agenda-files org-agenda-files)))
      (todo "CANC"
            ((org-agenda-overriding-header "Cancelled Projects")
             (org-agenda-files org-agenda-files)))))))

(setq org-capture-templates
      '(("t" "Todo" entry (file "~/org/refile.org")
	 "* TODO %?\nDEADLINE: %T\n  %a")))

;; Magit
(use-package magit
  :config
  (key! "<leader>g" 'magit))

;; No startup
(setq inhibit-startup-screen t)
;; disable backup
(setq backup-inhibited t)
(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)
;; add borders
(set-frame-parameter nil 'internal-border-width 10)
;; To disable the menu bar, place the following line in your .emacs file:
(menu-bar-mode -1)
;; To disable the scroll bar, use the following line:
(toggle-scroll-bar -1)
;; To disable the toolbar, use the following line:
(tool-bar-mode -1)
;; don't ask to spell out "yes"
(fset 'yes-or-no-p 'y-or-n-p)

;; Completion BEGIN --------------------------------------------------
(setq hippie-expand-try-functions-list
      '(
	try-expand-dabbrev
	try-expand-dabbrev-all-buffers
	;; try-expand-dabbrev-from-kill
	try-complete-lisp-symbol-partially
	try-complete-lisp-symbol
	try-complete-file-name-partially
	try-complete-file-name
	;; try-expand-all-abbrevs
	;; try-expand-list
	;; try-expand-line
	))

(use-package company
  :bind (:map company-active-map
	      ("RET" . company-complete-selection)
	      ("C-j" . company-select-next)
	      ("C-k" . company-select-previous))
  :custom
  (company-minimum-prefix-length 1)
  (company-idle-delay 0.0)
  :init
  (global-company-mode 1))

(use-package company-box
  :hook (company-mode . company-box-mode))
;; Completion END --------------------------------------------------

;; Window config ---------------------------------------------------
(use-package edwina
  :config
  (setq display-buffer-base-action '(display-buffer-below-selected)))

;;archive completed tasks
(defun my-org-archive-done-tasks ()
  (interactive)
  (org-map-entries 'org-archive-subtree "/DONE" 'file))

;; Window Config END -----------------------------------------------

;; dired settings --------------------------------------------------

;; A poor mans vim vinegar 
(defun cherry-dired-mode-setup ()
  "to be run as hook for `dired-mode'."
  (dired-hide-details-mode 1)
  (define-key dired-mode-map (kbd "-") (lambda () (interactive) (find-alternate-file ".."))))

(add-hook 'dired-mode-hook 'cherry-dired-mode-setup)

(use-package dired-single
  :config
  (define-key evil-normal-state-map (kbd "-") 'dired-jump)
  (evil-collection-define-key 'normal 'dired-mode-map
    "a" 'dired-create-empty-file
    "r" 'dired-toggle-read-only
    "A" 'dired-create-directory
    "h" 'dired-single-up-directory
    "l" 'dired-single-buffer))

(set-frame-font "Fira Code 16" nil t)

;; Modeline ---------------------------------------------------------
;; Use minibuffer as modeline for better space efficience
(use-package mini-modeline
  :init
  (setq mini-modeline-r-format
	(list
	 ;; value of `mode-name'
	 ;; value of current buffer name
	 '(:eval (propertize "%b, " 'face 'font-lock-variable-name-face))
	 '(:eval (propertize (if (eq 'emacs evil-state) "  " "  ")
			     'face 'epa-validity-high))
	 ;; value of current line number
	 "l:%l "
	 ;; major mode
	 "%m: "
	 "                 "
	 ;; ;; spaces to align right
	 ;; '(:eval (propertize
	 ;; 		" " 'display
	 ;; 		`((space :align-to (- (+ right right-fringe right-margin)
	 ;; 				      ,(+ 10 (string-width mode-name)))))))
	 ;; value of use
	 '(:eval (propertize
		  (format-time-string "%a, %b %d %I:%M%p")
		  'face 'change-log-list))))
  :config
  (mini-modeline-mode t))

;; Poor man harpoon ----------------------------------------------------------
(defun eshell-with-name (name)
  (interactive)
  (progn
    (eshell)
    (rename-buffer name)))

(defun eshell-1 ()
  (interactive)
  (eshell-with-name "1"))

(defun eshell-2 ()
  (interactive)
  (eshell-with-name "2"))

(defun eshell-3 ()
  (interactive)
  (eshell-with-name "3"))

(defun eshell-4 ()
  (interactive)
  (eshell-with-name "4"))

(key! "<leader>1" 'eshell-1)
(key! "<leader>2" 'eshell-2)
(key! "<leader>3" 'eshell-3)
(key! "<leader>4" 'eshell-4)

;; LSP client -------------------------------------------------------------
(use-package typescript-mode)
(use-package web-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  (setq web-mode-enable-auto-indentation nil)
  (defun web-mode-init-hook ()
    "Hooks for Web Mode. Adjust indent"
    (interactive)
    (setq web-mode-markup-indent-offset 2))
  (add-hook 'web-mode-hook 'web-mode-init-hook))

(use-package eglot
  :config
  (add-to-list 'eglot-server-programs '(web-mode . ("typescript-language-server" "--stdio")))
  (add-hook 'web-mode-hook 'eglot-ensure)
  (add-hook 'typescript-mode-hook 'eglot-ensure)
  (key! "<leader>cr" 'eglot-rename)
  (key! "<leader>ca" 'eglot-code-actions)
  (key! "<leader>co" 'eglot-code-action-organize-imports))
;; LSP client END ---------------------------------------------------------

;; Projectile ------------------------------------------------------------
(use-package projectile
  :config
  (setq projectile-switch-project-action #'projectile-dired)
  (projectile-mode)
  :bind-keymap
  ("C-c p" . projectile-command-map))

(key! "<leader> pp" 'projectile-switch-project)
(key! "<leader> ps" 'projectile-ag)
(key! "<leader> SPC" 'projectile-find-file)
(key! "<leader> pt" 'projectile-run-eshell)
(key! "<leader> p!" 'projectile-run-async-shell-command-in-root)
;; Projectile END --------------------------------------------------------
