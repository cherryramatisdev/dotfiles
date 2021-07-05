(require 'modus-themes)
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

(load-theme 'modus-vivendi t)

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
(eval-after-load "flycheck" '(diminish 'flycheck-mode))
(eval-after-load "smartparens" '(diminish 'smartparens-mode))
(eval-after-load "paredit" '(diminish 'paredit-mode))
(eval-after-load "subword" '(diminish 'subword-mode))
(eval-after-load "npm-mode" '(diminish 'npm-mode))
(eval-after-load "tree-sitter" '(diminish 'tree-sitter-mode))
(eval-after-load "which-key" '(diminish 'which-key-mode))


;; DEFINE MODELINE -------------------------------
(setq mode-line-percent-position '(-3 "%p"))
(setq mode-line-position-column-line-format '(" %l,%c")) ; Emacs 28
(setq mode-line-defining-kbd-macro
      (propertize " Macro" 'face 'mode-line-emphasis))

(display-time-mode 1)                   ;; activate time display
(setq display-time-day-and-date t) 
(setq  display-time-24hr-format t)
(setq display-time-format "%H:%M  %d/%m/%Y")

(setq-default mode-line-modes
              (seq-filter (lambda (s)
                            (not (and (stringp s)
                                      (string-match-p
                                       "^\\(%\\[\\|%\\]\\)$" s))))
                          mode-line-modes))

(setq mode-line-compact nil)            ; Emacs 28
(setq-default mode-line-format
              '("%e"
                mode-line-front-space
                mode-line-mule-info
                mode-line-client
                mode-line-modified
                mode-line-remote
                mode-line-frame-identification
                mode-line-buffer-identification
                "  "
                ;; mode-line-position
                mode-line-modes
                "  "
                (vc-mode vc-mode)
                "  "
                mode-line-misc-info
                "  "
                mode-line-end-spaces))

(provide 'appearance)
