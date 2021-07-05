(require 'evil)
(require 'undo-fu)
(require 'undo-fu-session)

(global-undo-fu-session-mode)

(setq evil-want-Y-yank-to-eol t)
(setq evil-want-C-d-scroll t)
(setq evil-want-C-u-scroll t)
(setq evil-want-keybinding nil)
(setq evil-split-window-below t)
(setq evil-split-window-right t)
(setq evil-undo-system 'undo-fu)

(evil-mode 1)

(evil-set-leader 'normal ",")
(evil-define-key 'normal   'global (kbd "<leader>ee") 'eval-last-sexp)

(evil-define-key 'normal 'global (kbd "gl") 'evil-end-of-line)
(evil-define-key 'normal 'global (kbd "gh") 'evil-first-non-blank)

(with-eval-after-load 'evil
  (add-hook 'git-commit-mode-hook 'evil-insert-state)
  (evil-set-initial-state 'magit-log-edit-mode 'insert))

(global-set-key (kbd "<escape>") 'keyboard-escape-quit)

(require 'evil-collection)

(evil-collection-init)

(require 'evil-org)
(add-hook 'org-mode-hook 'evil-org-mode)
(evil-org-set-key-theme '(navigation insert textobjects additional calendar))
(require 'evil-org-agenda)
(evil-org-agenda-set-keys)

(require 'evil-commentary)
(evil-commentary-mode)

(require 'evil-surround)
(global-evil-surround-mode 1)

(require 'dired-single)

(evil-collection-define-key 'normal 'dired-mode-map
  "a" 'dired-create-empty-file
  "r" 'dired-toggle-read-only
  "A" 'dired-create-directory
  "h" 'dired-single-up-directory
  "l" 'dired-single-buffer)

(provide 'setup-evil)
