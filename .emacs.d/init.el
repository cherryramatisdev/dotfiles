;; -*- coding: utf-8; lexical-binding: t -*-

(add-to-list 'load-path "~/.emacs.d/lisp/")

;; HHH________________________________________________

(require 'advices)
(require 'aliases)
(require 'backup-file)
(require 'cursor-position)
(require 'dired-config)
(require 'editing-related)
(require 'eww-config)
(require 'font-setup)
(require 'general)
(require 'indentation)
(require 'org-config)
(require 'user-interface)
(require 'whitespaces)
(require 'buffer-management)
(require 'fuzzyfinding)

(require 'plugins)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
