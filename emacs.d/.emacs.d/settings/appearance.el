(setq font-lock-maximum-decoration t
      truncate-partial-width-windows nil)

;; Please don't use my speakers for nothing
(setq visible-bell nil)
(setq ring-bell-function (lambda ()
                           (invert-face 'mode-line)
                           (run-with-timer 0.05 nil 'invert-face 'mode-line)))

;; Highlight current line
(global-hl-line-mode 1)

(setq css-fontify-colors nil)

;; Set custom theme path
(setq custom-theme-directory (concat user-emacs-directory "themes"))

(dolist
    (path (directory-files custom-theme-directory t "\\w+"))
  (when (file-directory-p path)
    (add-to-list 'custom-theme-load-path path)))

(load-theme 'default-black t)

;; Don't defer screen updates when performing operations
(setq redisplay-dont-pause t)

;; Org-mode colors
(setq org-todo-keyword-faces
      '(
        ("DONE" . (:foreground "green" :weight bold))
        ("CANCELLED" . (:foreground "red" :weight bold))
        ))

;; Highlight matching parentheses when the point is on them.
(show-paren-mode 1)

(when window-system
  (setq frame-title-format '(buffer-file-name "%f" ("%b")))
  (tooltip-mode -1)
  (blink-cursor-mode -1))

;; Unclutter the modeline
(unless (package-installed-p 'diminish)
  (package-install 'diminish))

(require 'diminish)
(eval-after-load "yasnippet" '(diminish 'yas-minor-mode))
(eval-after-load "projectile" '(diminish 'projectile-mode))
(eval-after-load "auto-complete" '(diminish 'auto-complete-mode))
(eval-after-load "eldoc" '(diminish 'eldoc-mode))
(eval-after-load "tide" '(diminish 'tide-mode))
(eval-after-load "company" '(diminish 'company-mode))
(eval-after-load "prettier-js" '(diminish 'prettier-js-mode))
(eval-after-load "flymake" '(diminish 'flymake-mode))

(provide 'appearance)
