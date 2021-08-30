;; (require 'smex)
;; (require 'ido-vertical-mode)
;; (require 'flx)
;; (require 'flx-ido)

;; (smex-initialize)
;; (global-set-key (kbd "M-x") 'smex)

;; ;; minibuffer setup
;; (setq enable-recursive-minibuffers t)
;; (savehist-mode 1)
;; ;; big minibuffer height, for ido to show choices vertically
;; (setq max-mini-window-height 0.5)
;; ;; minibuffer, stop cursor going into prompt
;; (customize-set-variable
;;  'minibuffer-prompt-properties
;;  (quote (read-only t cursor-intangible t face minibuffer-prompt)))

;; ;; minibuffer enhanced completion
;; (require 'icomplete)
;; (icomplete-mode 1)
;; ;; show choices vertically
;; (setq icomplete-separator "\n")
;; (setq icomplete-hide-common-prefix nil)
;; (setq icomplete-in-buffer t)
;; (define-key icomplete-minibuffer-map (kbd "C-n") 'icomplete-forward-completions)
;; (define-key icomplete-minibuffer-map (kbd "C-p") 'icomplete-backward-completions)

;; (require 'ido)
;; (ido-mode 1)
;; (ido-everywhere 1)
;; (flx-ido-mode 1)
;; (ido-vertical-mode 1)
;; (setq ido-vertical-define-keys 'C-n-and-C-p-only)

;; ;; disable ido faces to see flx highlights.
;; (setq ido-use-faces nil)

;; ;; show any name that has the chars you typed
;; (setq ido-enable-flex-matching t)

;; ;; use current pane for newly opened file
;; (setq ido-default-file-method 'selected-window)

;; ;; use current pane for newly switched buffer
;; (setq ido-default-buffer-method 'selected-window)

;; ;; stop ido from suggesting when naming new file
;; (when (boundp 'ido-minor-mode-map-entry)
;;   (define-key (cdr ido-minor-mode-map-entry) [remap write-file] nil))
