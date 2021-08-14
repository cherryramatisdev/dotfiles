;; -*- coding: utf-8; lexical-binding: t -*-

;; HHH_______________________________________________________________

;; remember cursor position
(if (version< emacs-version "25.0")
    (progn
      (require 'saveplace)
      (setq-default save-place t))
  (save-place-mode 1))

(provide 'cursor-position)
