;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq defuns-dir
      (expand-file-name "defuns" user-emacs-directory))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path defuns-dir)

;; General settings
(require 'general)
(require 'appearance)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files
(setq create-lockfiles nil)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

(require 'setup-package)

;; Install extensions if they're missing
(defun init--install-packages ()
  (packages-install
   '(
     css-eldoc
     elisp-slime-nav
     f
     fill-column-indicator
     flx
     flx-ido
     flycheck
     flycheck-pos-tip
     highlight-escape-sequences
     ido-at-point
     ido-completing-read+
     ido-vertical-mode 
     magit
     markdown-mode
     nodejs-repl
     paredit
     perspective
     projectile
     ;; request
     restclient
     ripgrep
     smartparens
     ;; string-edit
     visual-regexp
     wgrep
     whitespace-cleanup-mode
     yasnippet
     find-file-in-project
     multiple-cursors
     ace-jump-mode
     expand-region
     prettier-js
     typescript-mode
     web-mode
     auto-complete
     tide
     zencoding-mode
     )))

(condition-case nil
    (init--install-packages)
  (error
   (package-refresh-contents)
   (init--install-packages)))

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup environment variables from the user's shell.
;; (when is-mac
;;   (require-package 'exec-path-from-shell)
;;   (exec-path-from-shell-initialize))

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'yasnippet '(require 'setup-yasnippet))
(eval-after-load 'perspective '(require 'setup-perspective))

(require 'setup-org)

(require 'setup-ffip)

;; Font lock dash.el
(eval-after-load "dash" '(dash-enable-font-lock))

;; Default setup of smartparens
(require 'smartparens-config)
(setq sp-autoescape-string-quote nil)
(--each '(css-mode-hook
          restclient-mode-hook
          js-mode-hook
          elisp-mode-hook
          markdown-mode)
  (add-hook it 'turn-on-smartparens-mode))

;; Utils functions
(require 'utils-defuns)

;; Setup keybindingsnx
(require 'key-bindings)

;; Setup completion
(require 'setup-completion)

;; Setup languages
(require 'setup-typescript)

;; Some general hooks
(require 'general-hooks)
