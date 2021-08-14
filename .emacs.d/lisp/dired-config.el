;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH________________________________________________________
(progn
  (require 'dired-x)
  (setq dired-dwin-target t)
  (when (string-equal system-type "gnu/linux") (setq dired-listing-switches "-al --time-style long-iso"))
  (setq dired-recursive-copies 'always)
  (setq dired-recursive-deletes 'always))

(provide 'dired-config)
