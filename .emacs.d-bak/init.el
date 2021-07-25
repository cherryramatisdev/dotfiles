(load "~/.emacs.d/lisp/core.el")

;; General settings
(require 'setup-package)
(load "~/.emacs.d/package.el")
(require 'general)
(require 'appearance)

;; Lets start with a smattering of sanity
(require 'sane-defaults)

;; Are we on a mac?
(setq is-mac (equal system-type 'darwin))

;; Setup extensions
(require 'setup-completion)
(eval-after-load 'dired '(require 'setup-dired))
(eval-after-load 'magit '(require 'setup-magit))
(eval-after-load 'perspective '(require 'setup-perspective))
(require 'setup-yasnippet)
(require 'setup-org)
(require 'setup-projects)
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
;; Setup keybindings
(require 'key-bindings)
;; Setup lsp
(require 'setup-lsp)
;; Setup languages
(require 'setup-rust)
(require 'setup-typescript)
(require 'setup-lisp)
(require 'setup-python)
;; Setup workspaces
(require 'setup-perspective)
;; Setup treesitter
(require 'setup-treesitter)
;; Some general hooks
(require 'general-hooks)
;; Configure which key
(require 'setup-whichkey)
;; Advices to make emacs my own
(require 'advices)
;; EXWM
(require 'setup-exwm)

