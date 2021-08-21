;; HHH________________________________________________________

;; user interface
;; TODO: the column number is white while theme is black
;; (when (version<= "26.0.50" emacs-version)
;;   (progn
;;     (global-display-line-numbers-mode)
;;     (setq display-line-numbers 'relative)))

(column-number-mode 1)
(blink-cursor-mode 0)
(setq use-dialog-box nil)

(progn
  ;; no need to warn
  (put 'narrow-to-region 'disabled nil)
  (put 'narrow-to-page 'disabled nil)
  (put 'upcase-region 'disabled nil)
  (put 'downcase-region 'disabled nil)
  (put 'erase-buffer 'disabled nil)
  (put 'scroll-left 'disabled nil)
  (put 'dired-find-alternate-file 'disabled nil)
  )

(provide 'user-interface)
