;; ;; -*- coding: utf-8; lexical-binding: t -*-
;; ;; HHH___________________________________________________________________

;; (progn
;;   ;; minibuffer setup
;;   (setq enable-recursive-minibuffers t)
;;   (savehist-mode 1)
;;   ;; big minibuffer height, for ido to show choices vertically
;;   (setq max-mini-window-height 0.5)
;;   ;; minibuffer, stop cursor going into prompt
;;   (customize-set-variable
;;    'minibuffer-prompt-properties
;;    (quote (read-only t cursor-intangible t face minibuffer-prompt))))

;; (progn
;;   ;; minibuffer enhanced completion
;;   (require 'icomplete)
;;   (icomplete-mode 1)
;;   ;; show choices vertically
;;   (setq icomplete-separator "\n")
;;   (setq icomplete-hide-common-prefix nil)
;;   (setq icomplete-in-buffer t)
;;   (define-key icomplete-minibuffer-map (kbd "<right>") 'icomplete-forward-completions)
;;   (define-key icomplete-minibuffer-map (kbd "<left>") 'icomplete-backward-completions))

;; (progn
;;   ;; make buffer switch command do suggestions, also for find-file command
;;   (require 'ido)
;;   (ido-mode 1)
;;   ;; show choices vertically
;;   (setf (nth 2 ido-decorations) "\n")
;;   ;; show any name that has the chars you typed
;;   (setq ido-enable-flex-matching t)
;;   ;; use current pane for newly opened file
;;   (setq ido-default-file-method 'selected-window)
;;   ;; use current pane for newly switched buffer
;;   (setq ido-default-buffer-method 'selected-window)
;;   ;; stop ido from suggesting when naming new file
;;   (when (boundp 'ido-minor-mode-map-entry)
;;     (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil)))

;; (provide 'ido-config)
