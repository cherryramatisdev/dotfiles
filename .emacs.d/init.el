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

(require 'plugins)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   '("687e997f50a47c647c5132f0671df27b8a3ff4f18e31210dc53abeaa7ea8cde3" "c03d60937e814932cd707a487676875457e0b564a615c1edfd453f23b06fe879" "9527feeeec43970b1d725bdc04e97eb2b03b15be982ac50089ad223d3c6f2920" default))
 '(warning-suppress-types '((comp))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
