;; Set path to dependencies
(setq settings-dir
      (expand-file-name "settings" user-emacs-directory))
(setq defuns-dir
      (expand-file-name "defuns" user-emacs-directory))
(add-to-list 'load-path settings-dir)
(add-to-list 'load-path defuns-dir)

;; General settings
(require 'setup-package)
(load "~/.emacs.d/package.el")
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

(require-package 'dash)

(require 'dash)

;; Save point position between sessions
(require 'saveplace)
(setq-default save-place t)
(setq save-place-file (expand-file-name ".places" user-emacs-directory))

;; No more RSI(Validate if this is good ????)
;; (require 'god-mode)
;; (global-set-key (kbd "<escape>") #'god-local-mode)
 
;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

(setq exec-path (append exec-path '("~/.nvm/versions/node/v16.3.0/bin")))

(require-package 'exec-path-from-shell)
(exec-path-from-shell-initialize)

;; Setup extensions
(eval-after-load 'ido '(require 'setup-ido))
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'perspective '(require 'setup-perspective))

(require 'setup-yasnippet)

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

;; Setup lsp
(require 'setup-lsp)

;; Setup completion
(require 'setup-completion)

;; Setup languages
(require 'setup-typescript)
(require 'setup-lisp)

;; Setup workspaces
(require 'setup-perspective)

;; Setup treesitter
(require 'setup-treesitter)

;; Some general hooks
(require 'general-hooks)

;; Advices to make emacs my own
(require 'advices)
