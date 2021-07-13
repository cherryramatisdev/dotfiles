;; Set path to dependencies
(setq lisp-dir
      (expand-file-name "lisp" user-emacs-directory))
(setq defuns-dir
      (expand-file-name "defuns" user-emacs-directory))

(add-to-list 'load-path lisp-dir)
(add-to-list 'load-path defuns-dir)

;; Write backup files to own directory
(setq backup-directory-alist
      `(("." . ,(expand-file-name
                 (concat user-emacs-directory "backups")))))

;; Write all autosave files in the tmp dir
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

;; Don't write lock-files
(setq create-lockfiles nil)

;; List library on emacs lisp
(require 'dash)

(setq exec-path (append exec-path '("~/.nvm/versions/node/v16.3.0/bin")))

(require 'exec-path-from-shell)
(exec-path-from-shell-initialize)
