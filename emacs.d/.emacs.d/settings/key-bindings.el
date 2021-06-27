;; Configure ace jump
(require 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)

;; Mnemonic to C-x REALLY QUIT
(global-set-key (kbd "C-x r q") 'save-buffers-kill-terminal)
(global-set-key (kbd "C-x C-c") 'delete-frame)

;; Completion that uses many different methods to find options.
(global-set-key (kbd "C-.") 'hippie-expand-no-case-fold)
(global-set-key (kbd "C-:") 'hippie-expand-lines)
(global-set-key (kbd "C-,") 'completion-at-point)

(global-set-key (kbd "C-x C-m") 'smex)

;; Multiple cursors
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

;; Quickly jump through small region
(define-key global-map (kbd "C-c f") 'ace-jump-mode)

;; Perform general cleanup.
(global-set-key (kbd "C-c C-<return>") 'delete-blank-lines)

;; Indent
(global-set-key (kbd "M-i") 'back-to-indentation)

;; Use shell-like backspace C-h, rebind help to C-c h
;; (define-key key-translation-map [?\C-h] [?\C-?])
;; (global-set-key (kbd "C-c h") 'help-command)

(global-set-key (kbd "M-h") 'kill-region-or-backward-word)
;; (global-set-key (kbd "C-w") 'kill-region-or-backward-word)

;; iy go-to-char - like f in vim
(require 'iy-go-to-char)
(global-set-key (kbd "M-m") 'iy-go-to-char)
(global-set-key (kbd "s-m") 'iy-go-to-char-backward)

;; File finding
(global-set-key (kbd "C-x M-f") 'ido-find-file-other-window)
(global-set-key (kbd "C-x C-b") 'ibuffer)

;; Indentation help
(global-set-key (kbd "M-j") (lambda () (interactive) (join-line -1)))

(global-set-key (kbd "M-p") 'backward-paragraph)
(global-set-key (kbd "M-n") 'forward-paragraph)

;; Clever newlines
(global-set-key (kbd "C-o") 'open-line-below)
(global-set-key (kbd "<C-return>") 'open-line-below)
(global-set-key (kbd "<C-S-return>") 'open-line-above)
(global-set-key (kbd "<M-return>") 'new-line-dwim)

;; Open dired quickly
(global-set-key (kbd "C-x C-j") 'dired-jump)

;; Expand region
(global-set-key (kbd "C-=") 'er/expand-region)

;; Zoom in and Zoom out
(global-set-key (kbd "C-+") 'text-scale-adjust)

;; Ace window
(require 'ace-window)
(global-set-key (kbd "C-x o") 'ace-window)
(setq aw-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l))

;; Crux
(require 'crux)
(global-set-key [remap move-beginning-of-line] #'crux-move-beginning-of-line)
(global-set-key (kbd "C-k") 'crux-smart-kill-line)
(global-set-key (kbd "C-c d") 'crux-duplicate-current-line-or-region)
(global-set-key (kbd "C-c t") 'crux-visit-shell-buffer)

;; Utils functions
(global-set-key (kbd "C-c ul") 'switch-language)

(provide 'key-bindings)
