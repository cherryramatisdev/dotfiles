;; -*- coding: utf-8; lexical-binding: t -*-

;; backup and file related

(defun cherry:save-all-unsaved ()
  "Save all unsaved files. no ask."
  (interactive)
  (save-some-buffers t))

(if (version< emacs-version "27")
    (add-hook 'focus-out-hook 'cherry:save-all-unsaved)
  (setq after-focus-change-function 'cherry:save-all-unsaved))

(setq make-backup-files nil)
(setq backup-by-copying t)
(setq create-lockfiles nil)
(setq auto-save-default nil)

(require 'recentf)
(recentf-mode 1)

(global-auto-revert-mode 1)
