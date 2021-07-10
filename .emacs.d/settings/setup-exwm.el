(require 'exwm)

(add-hook 'exwm-update-class-hook
          (lambda ()
            (exwm-workspace-rename-buffer exwm-class-name)))

;;;; Global Key Bindings
(setq exwm-input-global-keys
      `(
        ;; Window Managment
        (,(kbd "C-c C-n")  . edwina-select-next-window)
        (,(kbd "C-c C-w C-n")  . edwina-select-next-window)
        (,(kbd "C-c C-p")  . edwina-select-previous-window)
        (,(kbd "C-c C-w C-p")  . edwina-select-previous-window)
        (,(kbd "C-c C-w n")  . edwina-swap-next-window)
        (,(kbd "C-c C-w p")  . edwina-swap-previous-window)
        ([?\s-s] . edwina-dec-nmaster)
        ([?\s-a] . edwina-inc-nmaster)
        ([?\s-v] . edwina-zoom)
        (,(kbd "s-]")           . edwina-inc-mfact)
        (,(kbd "s-[")           . edwina-dec-mfact)
        (,(kbd "s-q")           . edwina-delete-window)
        (,(kbd "C-c C-v")           . edwina-clone-window)
        (,(kbd "C-c r")           . rename-buffer)
        ;; ([?\s-f] . exwm-layout-set-fullscreen)
        ([?\s-q] . edwina-delete-window) ; closing windows
        ([?\s-c] . (lambda ()
                     (interactive)
                     (kill-this-buffer)
                     (edwina-delete-window)))
        ;; reset exwm
        ([?\s-r] . (lambda ()
                     (interactive)
                     (exwm-reset)
                     (edwina-arrange)))
        ;; open a terminal
        (,(kbd "s-t") . (lambda ()
                          (interactive)
                          (edwina-clone-window)
                          (vterm)))
        ;; launch any program
        ([?\s-d] . (lambda (command)
                           (interactive (list (read-shell-command "λ ")))
                           (start-process-shell-command command nil command)))
        ;; web browser
        ([?\s-w] . (lambda ()
                     (interactive)
                     (start-process-shell-command "web browser personal" nil "personal")))

        (,(kbd "s-e") . eshell)
        
        ;;powermanager FIX THIS
        ([?\s-x] . (lambda ()
                     (interactive)
                     (start-process-shell-command "power menu" nil "arcolinux-logout")))
        ([?\s-b] . exwm-workspace-switch-to-buffer)
        (,(kbd "C-x C-b") . ibuffer)
        (,(kbd "s-B") . ibuffer)
        ([?\s-p] . (lambda ()
                     (interactive)
                     (start-process-shell-command "Screenshot" nil "scrot '%Y-%m-%d_$wx$h.png' -e 'mv $f ~/Pictures/screenshots'")))
;;;; Workspaces
        ([?\s-g] . exwm-workspace-switch)
        ,@(mapcar (lambda (i)
                    `(,(kbd (format "M-%d" i)) .
                      (lambda ()
                        (interactive)
                        (exwm-workspace-switch-create ,i))))
                  (number-sequence 0 9))))

(setq exwm-input-simulation-keys
          `((,(kbd "C-b") . ,(kbd "<left>"))
            (,(kbd "M-b") . ,(kbd "C-<left>"))
            (,(kbd "C-f") . ,(kbd "<right>"))
            (,(kbd "M-f") . ,(kbd "C-<right>"))
            (,(kbd "C-p") . ,(kbd "<up>"))
            (,(kbd "C-n") . ,(kbd "<down>"))
            (,(kbd "C-a") . ,(kbd "<home>"))
            (,(kbd "C-e") . ,(kbd "<end>"))
            (,(kbd "C-g") . [escape])
            ;; q and w are convenient if Caps Lock key is Hyper key
            (,(kbd "C-d") . ,(kbd "<delete>"))
            (,(kbd "C-k") . ,(kbd "S-<end> <delete>"))
            ;; cut/paste.
            (,(kbd "M-w") . ,(kbd "C-c"))
            (,(kbd "C-y") . ,(kbd "C-v"))
            ;; search
            (,(kbd "C-s") . ,(kbd "C-f"))
            ))

(define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

(fringe-mode 1)

(start-process-shell-command "caps to control" nil "setxkbmap us -option 'caps:ctrl_modifier'")
;; Set the default number of workspaces
(setq exwm-workspace-number 10)
(setq exwm-layout-show-all-buffers nil)
(setq exwm-randr-workspace-output-plist '(1 "HDMI-0"))

;; Start exwm
(exwm-enable)

;;;; Window Divider
(setq window-divider-default-right-width 3)
(let ((color (face-background 'mode-line)))
  (dolist (face '(window-divider-first-pixel
                  window-divider-last-pixel
                  window-divider))
    (set-face-foreground face color)))

(window-divider-mode 1)

(require 'exwm-systemtray)
(exwm-systemtray-enable)
(setq exwm-systemtray-height 23)

;; (require 'exwm-mff)
;; (exwm-mff-mode t) ;; mouse follows focus

(require 'edwina)
(setq display-buffer-base-action '(display-buffer-below-selected))

(provide 'setup-exwm)
