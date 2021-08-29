;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH___________________________________________
;; initial window and default window
(setq inhibit-startup-screen t)

(if (display-graphic-p)
    (setq initial-frame-alist
	  '(
	    (tool-bar-lines . 0)
	    (width . 106)
	    (height . 56)
	    ))
  (setq initial-frame-alist '( (tool-bar-lines . 0))))

(setq default-frame-alist
      '(
	(tool-bar-lines . 0)
	(width . 100)
	(height . 55)))

(scroll-bar-mode -1)
(menu-bar-mode -1)

;; HHH____________________________________________
;; UTF-8 as default encoding
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8-unix)
