;; -*- coding: utf-8; lexical-binding: t -*-


;; HHH___________________________________________________________________
;; indentation, end of line

(electric-indent-mode 0)

(set-default 'tab-always-indent 'complete)

;; no mixed tab space
(setq-default indent-tabs-mode nil)
 ; gnu emacs 23.1, 24.4.1 default is t

;; 4 is more popular than 8.
(setq-default tab-width 4)

(setq sentence-end-double-space nil )

(provide 'indentation)
