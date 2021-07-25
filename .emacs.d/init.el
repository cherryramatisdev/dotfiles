;; Set path to dependencies
(setq cherry-dir
      (expand-file-name "lisp/cherry" user-emacs-directory))
(setq config-dir
      (expand-file-name "lisp/config" user-emacs-directory))
(setq plugin-dir
      (expand-file-name "lisp/plugin" user-emacs-directory))

(add-to-list 'load-path cherry-dir)
(add-to-list 'load-path config-dir)
(add-to-list 'load-path plugin-dir)

(require 'config-init)
(require 'config-ui)
(require 'config-advices)
(require 'config-mappings)
(require 'config-editing)

;; Project management
(require 'config-project)

;; Third party Packages
(require 'plugin-init)
(require 'plugin-install)

;; MiniBuffer completion
(require 'plugin-vertico)
