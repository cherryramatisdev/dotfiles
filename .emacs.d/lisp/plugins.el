;; -*- coding: utf-8; lexical-binding: t -*-

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

(defun package! (pkg module)
  "Install package using straight.el and if provided a second argument load that too."
  (interactive)
  (if (not (eq module nil))
      (progn
        (straight-use-package pkg)
        (load (format "~/.emacs.d/lisp/plugin/%s.el" module)))
    (progn
      (straight-use-package pkg))))

(defun install-essential ()
  "Install essential packages like ido, company, projectile, perspective, etc..."
  (interactive)
  (progn
    (package! 'flx nil)
    (package! 'flx-ido nil)
    (package! 'smex nil)
    (package! 'ido-vertical-mode 'ido-config)
    (package! 'company-flx nil)
    (package! 'company-quickhelp nil)
    (package! 'company 'company-config)
    
    (package! 'perspective 'workspaces)
    (package! 'ag nil)
    (package! 'projectile 'projectile-config)))

(defun install-language ()
  "Install programming language related packages."
  (interactive)
  (progn
    (package! 'tree-sitter-langs nil)
    (package! 'tree-sitter 'treesitter-config)
    (package! 'typescript-mode nil)
    (package! 'web-mode 'tsx-config)
    (package! 'yaml-mode nil)
    (package! 'markdown-mode nil)
    (package! 'elm-mode 'elm-config)
    (package! 'flycheck nil)
    (package! 'npm-mode nil) 
    (package! 'tide 'tsjs-config)
    (package! 'format-all 'formatter)
    (package! 'clojure-mode nil)
    (package! 'clj-refactor 'clojure-config)
    ))

(defun install-editing ()
  "Install keyboard related packages."
  (interactive)
  (progn
    (package! 'crux 'crux-config)
    (package! 'ace-jump-mode 'jump-text-config)
    (package! 'multiple-cursors 'multiple-cursors-config)
    (package! 'iy-go-to-char 'go-to-char)
    (package! 'expand-region 'expand-region-config)
    (package! 'buffer-move 'buffer-move-config)))

(defun install-misc ()
  "Install misc packages."
  (interactive)
  (progn
    (package! 'gruber-darker-theme 'theme-color)
    (package! 'magit 'magit-config)
    (package! 'mood-line 'modeline)
    (package! 'bufler 'bufler-config)
    (package! 'exec-path-from-shell 'fix-path)
    (package! 'yasnippet-snippets nil)
    (package! 'yasnippet 'snippets)
    (package! 'key-chord 'keychord-config)
    (package! 'change-inner 'changeinner-config)
    (package! 'hardcore-mode 'hardcore-config)))

(install-essential)
(install-language)
(install-editing)
(install-misc)

(provide 'plugins)
