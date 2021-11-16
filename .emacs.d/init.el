;;; package --- Summary

;;; Commentary:
;; Emacs configuration

;;; Code:

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

(straight-use-package 'use-package)

(delete-selection-mode 1)

;; Path
(use-package exec-path-from-shell
  :straight t
  :init
  (exec-path-from-shell-initialize))

;; Disable backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Setup font
(add-to-list 'default-frame-alist '(font . "JetBrainsMono-14"))

;; Appearance
(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)

(setq frame-background-mode nil
      column-number-mode t
      frame-title-format (concat invocation-name "@" (system-name) " {%f}")
      inhibit-startup-screen t
      initial-scratch-message "# Hi Cherry, what do you want to do today?\n\n"
      initial-major-mode 'markdown-mode
      ;; no visible or audible bells, please
      visible-bell nil
      ring-bell-function (lambda nil (message "")))

;; Nice window divider in TTY emacs
(defun my-change-window-divider ()
  "Display-table."
  (let ((display-table (or buffer-display-table standard-display-table)))
    (set-display-table-slot display-table 5 ?│)
    (set-window-display-table (selected-window) display-table)))
(add-hook 'window-configuration-change-hook 'my-change-window-divider)

;; markdown
(use-package markdown-mode
  :straight t)

;; Enhanced M-x
(use-package vertico
  :straight t
  :custom
  (vertico-cycle t)
  :init
  (vertico-mode))

(use-package orderless
  :straight t
  :custom (completion-styles '(orderless)))

(use-package savehist
  :straight t
  :init
  (savehist-mode))

(use-package marginalia
  :after vertico
  :straight t
  :custom
  (marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
  :init
  (marginalia-mode))

;; Theme
(use-package gruber-darker-theme
  :straight t
  :init
  (load-theme 'gruber-darker t))

;; modeline
(use-package doom-modeline
  :straight t
  :init (doom-modeline-mode 1))

;; Show paren mode.
(show-paren-mode t)
(setq-default show-paren-style 'expression)
(use-package paren :straight t)
(set-face-background 'show-paren-match (face-background 'default))
(set-face-attribute 'show-paren-match nil :weight 'extra-bold)

;; saves the buffer/split configuration, makes it un/re-doable.
(winner-mode 1)
(global-set-key (kbd "<C-left>") 'winner-undo)
(global-set-key (kbd "<C-right>") 'winner-redo)

;; navigate between visible buffers (windows in emacs speak)
(defun other-window-backward (&optional n)
  "Navigate to previous window using N."
  (interactive "p")
  (if n
      (other-window (- n))
    (other-frame -1)))

(global-set-key (kbd "C-x C-n") 'other-window)
(global-set-key (kbd "C-x C-p") 'other-window-backward)

;; If selected delete selection, if not delete previous word like <C-backspace>
(defun cherry/delete-word-or-selection (start end)
  "Delete previous word if not selected, and delete selection if selected using START and END."
  (interactive "r")
  (if mark-active
      (delete-region start end)
    (backward-kill-word 1)))

(global-set-key (kbd "C-w") 'cherry/delete-word-or-selection)

;; edit this file init.el
(defun cherry/edit-dotfile ()
  "Edit init.el to modify Emacs."
  (interactive)
  (find-file-other-window "~/.emacs.d/init.el"))

(global-set-key (kbd "C-c /") 'cherry/edit-dotfile)

;; shortcuts in all mode
(global-set-key (kbd "M-SPC") 'hippie-expand)
(global-set-key (kbd "M-r") 'join-line)

;; minimising Emacs way too many times without wanting to.
(global-unset-key "\C-z")

;; don't write backslashed to insicate continuous lines
(set-display-table-slot standard-display-table 'wrap ?\ )

;; Treat 'y' as yes, 'n' as no.
(fset 'yes-or-no-p 'y-or-n-p)

;; prefer utf 8
(prefer-coding-system 'utf-8-unix)

;; white space
(setq tab-width 2)
(setq-default indent-tabs-mode nil)

;; This disables bidirectional text to prevent "trojan source"
;; exploits, see https://www.trojansource.codes/
(setf (default-value 'bidi-display-reordering) nil)

;; ws-butler cleans up whitespace only on the lines you've edited,
;; keeping messy colleagues happy ;-) Important that it doesn't clean
;; the whitespace on currrent line, otherwise, eclim leaves messy
;; code behind.
(use-package ws-butler
  :straight t
  :init
  (setq ws-butler-keep-whitespace-before-point nil)
  :config
  (ws-butler-global-mode))

;; Checker
(use-package flycheck
  :straight t
  :init
  (add-to-list 'display-buffer-alist
               `(,(rx bos "*Flycheck errors*" eos)
                 (display-buffer-reuse-window
                  display-buffer-in-side-window)
                 (side            . bottom)
                 (reusable-frames . visible)
                 (window-height   . 0.15)))
  (global-flycheck-mode))

;; prettier
(use-package prettier-js
  :after (web-mode typescript-mode)
  :straight t
  :config
  (add-hook 'typescript-mode-hook 'prettier-js-mode)
  (add-hook 'web-mode-hook 'prettier-js-mode))

;; eslint
;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
	      (append flycheck-disabled-checkers
		      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; Use this binding for something useful because we can quit with wm binding.
(global-unset-key (kbd "C-x C-c"))
(global-set-key (kbd "C-x C-c") 'compile)

;; Use another bind to kill inside terminal `emacsclient -t`
(global-set-key (kbd "C-x rq") 'save-buffers-kill-terminal)

;; newline and indent
(defun rc/newline-and-indent ()
  "Open newline and indent, like `o` inside vim."
  (interactive)
  (end-of-line)
  (newline-and-indent))

(global-set-key (kbd "C-m") 'rc/newline-and-indent)

(define-key query-replace-map [return] 'act)
(define-key query-replace-map [?\C-m] 'act)

;; Make Emacs wrap long lines visually, but no actually (i.e. no
;; extra line breaks are inserted.
(global-visual-line-mode 1)
;; wrap on 80 chars
(setq-default fill-column 80)
(auto-fill-mode)

;; Automatically reload files was modified by external program
(global-auto-revert-mode 1)
(setq revert-without-query (list "\\.png$" "\\.svg$")
      auto-revert-verbose nil)

;; Give visual hint where the cursor is when switching buffers.
(use-package beacon
  :straight t
  :init
  (beacon-mode 1))

;; Compile buffer
(use-package compile
  :init
  (setq compilation-ask-about-save nil
        compilation-scroll-output 'next-error
        ;; Don't stop on info or warnings.
        compilation-skip-threshold 2))

;; Multiple cursors
(use-package multiple-cursors
  :straight t
  :bind (("C->" . mc/mark-next-like-this)
         ("C-<" . mc/mark-previous-like-this)
         ("C-c C-<" . mc/mark-all-like-this)
         ("C-c C->" . mc/mark-all-like-this-dwim)
         ("C-c C-'" . mc/mark-all-like-this-in-defun)))

(use-package expand-region
  :straight t
  :bind ("C-=" . er/expand-region))

(defun rc/close-all-buffers ()
  "Close all available buffers."
  (interactive)
  (mapc 'kill-buffer (buffer-list)))

;; buffer names and mini buffer
(use-package uniquify
  :ensure nil
  :init
  (setq uniquify-buffer-name-style 'forward
        uniquify-separator ":"
        uniquify-strip-common-suffix nil
        read-file-name-completion-ignore-case t))

;; auto scroll the compilation window
(setq compilation-scroll-output t)

;; Scroll up and down while keeping the cursors where it is.
(defun help/scroll-up-one-line ()
  "Scroll up."
  (interactive)
  (scroll-down 1))

(defun help/scroll-down-one-line ()
  "Scroll down."
  (interactive)
  (scroll-up 1))

(global-set-key (kbd "M-p") 'help/scroll-down-one-line)
(global-set-key (kbd "M-n") 'help/scroll-up-one-line)

;; Auto complete
(use-package company
  :straight t
  :bind (("<C-return>" . company-complete))
  :init
  (setq company-idle-display 0.0
        company-global-modes '(not org-mode)
        company-minimum-prefix-length 1)
  (global-company-mode 1))

(use-package emojify
  :straight t
  :config
  (setq emojify-user-emojis
        '(
          (":autobots:" . (("name" . "Autobots Transformers") ("unicode" . "👾") ("style" . "ascii")))
          (":brain:" . (("name" . "Brain") ("unicode" . "🧠") ("style" . "ascii")))
          (":car:" . (("name" . "Car") ("unicode" . "🚗") ("style" . "ascii")))
          (":cat-on-keyboard:" . (("name" . "Cat on keyboard") ("unicode" . "🐈") ("style" . "ascii")))
          (":crossed_fingers:" . (("name" . "Crossed fingers") ("unicode" . "🤞") ("style" . "ascii")))
          (":exploding_head:" . (("name" . "Exploding head") ("unicode" . "🤯") ("style" . "ascii")))
          (":face_vomiting:" . (("name" . "Face vomitting") ("unicode" . "🤮") ("style" . "ascii")))
          (":face_with_monocle:" . (("name" . "Face with monocle") ("unicode" . "🧐") ("style" . "ascii")))
          (":facepalm:" . (("name" . "Facepalm") ("unicode" . "🤦") ("style" . "ascii")))
          (":green_flag:" . (("name" . "Green flag") ("unicode" . "🏁") ("style" . "ascii")))
          (":grimlock:" . (("name" . "Grimlock Transformers") ("unicode" . "🦖") ("style" . "ascii")))
          (":hand:" . (("name" . "Happy person raising one hand") ("unicode" . "🙋") ("style" . "ascii")))
          (":headstone:" . (("name" . "Headstone") ("unicode" . "🪦") ("style" . "ascii")))
          (":home_office:" . (("name" . "Home office") ("unicode" . "🏠") ("style" . "ascii")))
          (":kids:" . (("name" . "Kids") ("unicode" . "🧒") ("style" . "ascii")))
          (":loading:" . (("name" . "Loading ...") ("unicode" . "◌") ("style" . "ascii")))
          (":mage:" . (("name" . "Mage") ("unicode" . "🧙") ("style" . "ascii")))
          (":male-detective:" . (("name" . "Male detective") ("unicode" . "🕵️") ("style" . "ascii")))
          (":male_mage:" . (("name" . "Mage") ("unicode" . "🧙") ("style" . "ascii")))
          (":man-bowing:" . (("name" . "Man bowing") ("unicode" . "🙇") ("style" . "ascii")))
          (":man-facepalming:" . (("name" . "Man facepalming") ("unicode" . "🤦") ("style" . "ascii")))
          (":man-raising-hand:" . (("name" . "Man raising hand") ("unicode" . "🙋") ("style" . "ascii")))
          (":older_adult:" . (("name" . "Older adult") ("unicode" . "🧓") ("style" . "ascii")))
          (":man-running:" . (("name" . "Man running") ("unicode" . "🏃‍♂️") ("style" . "ascii")))
          (":man-shrugging:" . (("name" . "Man shrugging") ("unicode" . "🤷") ("style" . "ascii")))
          (":partyhat:" . (("name" . "Party hat") ("unicode" . "🎉") ("style" . "ascii")))
          (":partyparrot:" . (("name" . "Party parrot") ("unicode" . "🦜") ("style" . "ascii")))
          (":rain_cloud:" . (("name" . "Rain cloud") ("unicode" . "🌧️") ("style" . "ascii")))
          (":rotfl:" . (("name" . "Rolling on the floor laughing") ("unicode" . "🤣") ("style" . "ascii")))
          (":sandwich:" . (("name" . "Sandwich") ("unicode" . "🥪") ("style" . "ascii")))
          (":simple_smile:" . (("name" . "Simple smile") ("unicode" . "🙂") ("style" . "ascii")))
          (":skateboard:" . (("name" . "Skateboard") ("unicode" . "🛹") ("style" . "ascii")))
          (":skin-tone-2:" . (("name" . "Skin tone 2") ("unicode" . " ") ("style" . "ascii")))
          (":skin-tone-3:" . (("name" . "Skin tone 3") ("unicode" . " ") ("style" . "ascii")))
          (":skin-tone-4:" . (("name" . "Skin tone 3") ("unicode" . " ") ("style" . "ascii")))
          (":slack_call:" . (("name" . "On a call") ("unicode" . "📞") ("style" . "ascii")))
          (":snow_cloud:" . (("name" . "Snow cloud") ("unicode" . "🌨") ("style" . "ascii")))
          (":snowman_without_snow:" . (("name" . "Snowman without snow") ("unicode" . "⛄") ("style" . "ascii")))
          (":spock-hand:" . (("name" . "Vulcan salute") ("unicode" . "🖖") ("style" . "ascii")))
          (":star-struck:" . (("name" . "Star struck") ("unicode" . "🤩") ("style" . "ascii")))
          (":tada-colorful:" . (("name" . "Tada colourful") ("unicode" . "🎉") ("style" . "ascii")))
          (":teddy_bear:" . (("name" . "Teddy bear") ("unicode" . "🧸") ("style" . "ascii")))
          (":the_horns:" . (("name" . "Sign of the Horns") ("unicode" . "🤘") ("style" . "ascii")))
          (":tooth:" . (("name" . "Tooth") ("unicode" . "🦷") ("style" . "ascii")))
          (":tux_devil:" . (("name" . "Tux devil") ("unicode" . "👿") ("style" . "ascii")))
          (":uk:" . (("name" . "United Kingdom flag") ("unicode" . "🇬🇧") ("style" . "ascii")))
          (":umbrella_with_rain_drops:" . (("name" . "Umbrella with rain drops") ("unicode" . "☔") ("style" . "ascii")))
          (":waving-from-afar-left:" . (("name" . "Waving from afar left") ("unicode" . "👋") ("style" . "ascii")))
          (":waving-from-afar-right:" . (("name" . "Waving from afar right") ("unicode" . "👋") ("style" . "ascii")))
          (":welcome:" . (("name" . "You are welcome") ("unicode" . "👍") ("style" . "ascii")))
          (":woman-facepalming:" . (("name" . "Woman facepalming") ("unicode" . "🤦‍♀️") ("style" . "ascii")))
          (":woman-shrugging:" . (("name" . "Woman shrugging") ("unicode" . "🤷‍♀️️") ("style" . "ascii")))
          (":zombie:" . (("name" . "Zombie") ("unicode" . "🧟") ("style" . "ascii")))
          ))
  ;; If emojify is already loaded refresh emoji data
  (when (featurep 'emojify)
    (emojify-set-emoji-data)))

;; snippets
(use-package yasnippet
  :straight t
  :init
  (setq yas-snippet-dirs '("~/.emacs.d/snippets"))
  :config
  (autoload 'yas/expand "yasnippet" t)
  (autoload 'yas/load-directory "yasnippet" t)
  (mapc 'yas/load-directory yas/root-directory)
  (yas-global-mode 1))

;; file browser
(global-set-key (kbd "C-x C-j") 'dired-jump)

;; Clipboard. Copy from terminal emacs to the X clipboard.
(use-package xclip
  :straight t
  :config
  (xclip-mode 1))

;; Compilation mode
;; Convert shell escapes to  color
(add-hook 'compilation-filter-hook
          (lambda () (ansi-color-apply-on-region (point-min) (point-max))))

;; git
(use-package magit
  :straight t
  :bind (("C-x g" . magit))
  :config
  (setq magit-log-arguments '("-n256" "--graph" "--decorate" "--color")
        ;; Show diffs per word, looks nicer!
        magit-diff-refine-hunk t))

;; typescript/tsx
(use-package web-mode
  :straight t
  :mode
  ("\\.tsx$" . web-mode)
  :config
  (setq web-mode-enable-auto-pairing t)
  (setq web-mode-enable-css-colorization t))

(use-package typescript-mode
  :straight t)

;; projectile
(use-package projectile
  :straight t
  :init
  (setq projectile-enable-caching t
        projectile-mode-line '(:eval (format " [%s]" (projectile-project-name))))
  :config
  (projectile-global-mode)
  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)

  (setq projectile-globally-ignored-directories
        (append (list
                 ".next"
                 "elpa"
                 "dist"
                 "mpd"
                 "mpv"
                 "build"
                 "node_modules"
                 )
                projectile-globally-ignored-directories)))

;; perspectives
(use-package perspective
  :straight t
  :init
  (setq persp-mode-prefix-key (kbd "C-x p"))
  (persp-mode 1))

(use-package persp-projectile
  :straight t)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(persp-mode exec-path-from-shell prettier-js markdown-mode counsel-projectile doom-modeline typescript-mode web-mode xclip treemacs yasnippet emojify company-emoji company expand-region multiple-cursors beacon flycheck ws-butler gruber-darker-theme gruber-darker counsel use-package)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(provide 'init)

;;; init.el ends here
(put 'narrow-to-region 'disabled nil)
