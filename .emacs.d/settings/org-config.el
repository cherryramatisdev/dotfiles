;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH________________________________________________________________
(progn
  ;; org-mode
  ;; make "org-mode" syntax color code sections
  (setq org-src-fontify-natively t)
  (setq org-startup-folded nil)
  (setq org-return-follows-link t)
  (setq org-startup-truncated nil))

(add-hook 'org-mode-hook
          (lambda ()
            (local-set-key "\M-n" 'outline-next-visible-heading)
            (local-set-key "\M-p" 'outline-previous-visible-heading)
            ;; table
            (local-set-key "\C-\M-w" 'org-table-copy-region)
            (local-set-key "\C-\M-y" 'org-table-paste-rectangle)
            (local-set-key "\C-\M-l" 'org-table-sort-lines)
            ;; fix tab
            (local-set-key "\C-y" 'yank)))

(setq org-agenda-start-with-log-mode t)
(setq org-log-done 'time)
(setq org-log-into-drawer t)

(setq org-agenda-files
    '("~/projects/dotfiles/tasks/todo.org"))

(setq org-refile-targets
    '(("Archive.org" :maxlevel . 1)
      ("Tasks.org" :maxlevel . 1)))

;; Save Org buffers after refiling!
(advice-add 'org-refile :after 'org-save-all-org-buffers)

(setq org-capture-templates
      `(("t" "Task" entry (file+olp "~/projects/dotfiles/tasks/todo.org" "Inbox")
         "* TODO %?\n  %U\n  %a\n  %i" :empty-lines 1)))

(defvar note-dir "~/projects/dotfiles/wiki")
(defvar file-prefix (replace-regexp-in-string "\n" "" (shell-command-to-string "uuidgen")))

(defun cherry:create-new-note ()
  "Create new note."
  (interactive)
  (find-file (format "~/projects/dotfiles/wiki/%s-%s.org" file-prefix (read-string "Note name: "))))

(defun cherry:find-notes ()
    "Find notes."
  (interactive)
  (ido-find-file-in-dir "~/projects/dotfiles/wiki"))

(global-set-key (kbd "C-c a") 'org-agenda)
(global-set-key (kbd "C-c c") 'org-capture)
(global-set-key (kbd "C-x C-t") nil)
(global-set-key (kbd "C-x C-t n") 'cherry:create-new-note)
(global-set-key (kbd "C-x C-t f") 'cherry:find-notes)

(provide 'org-config)
