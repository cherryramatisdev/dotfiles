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

(package! 'savehist nil)
(package! 'marginalia nil)
(package! 'orderless nil)
(package! 'consult 'consult-config)
(package! 'vertico 'vertico-config)
(package! 'company-quickhelp nil)
(package! 'company 'company-config)
(package! 'magit 'magit-config)
(package! 'mood-line 'modeline)
(package! 'crux 'crux-config)
(package! 'bufler 'bufler-config)
(package! 'ace-jump-mode 'jump-text-config)
(package! 'multiple-cursors 'multiple-cursors-config)
(package! 'iy-go-to-char 'go-to-char)
(package! 'expand-region 'expand-region-config)
(package! 'buffer-move 'buffer-move-config)
(package! 'typescript-mode nil)
(package! 'web-mode 'tsx-config)
(package! 'yaml-mode nil)
(package! 'exec-path-from-shell 'fix-path)
(package! 'format-all 'formatter)

(package! 'tree-sitter-langs nil)
(package! 'tree-sitter 'treesitter-config)

(package! 'perspective 'workspaces)

(package! 'lsp-ui nil)
(package! 'lsp-mode 'lsp-config)

(package! 'yasnippet-snippets nil)
(package! 'yasnippet 'snippets)

(provide 'plugins)
