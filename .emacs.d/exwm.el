(defun cherry/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(use-package exwm
  :straight t
  :config
  ;; Xrandr
  (require 'exwm-randr)
  (exwm-randr-enable)
  (setq exwm-randr-workspace-monitor-plist '(1 "HDMI-1"
                                               2 "HDMI-1"
                                               3 "HDMI-1"
                                               4 "HDMI-1"
                                               5 "HDMI-1"
                                               6 "HDMI-1"
                                               7 "DVI-D-1"
                                               8 "DVI-D-1"
                                               9 "DVI-D-1"
                                               0 "DVI-D-1"))
  (setq exwm-workspace-warp-cursor t)
  (setq mouse-autoselect-window t
        focus-follows-mouse t)

  ;; Display all EXWM buffers from every workspace
  (setq exwm-workspace-show-all-buffers t)

  ;; Set the default number of workspaces
  (setq exwm-workspace-number 9)

  (setq display-time-day-and-date t)
  (display-time-mode 1)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'cherry/exwm-update-class)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-u
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\C-\ ))  ;; Ctrl+Space

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  ;; Set up global key bindings. These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([?\s-h] . windmove-left)
          ([?\s-l] . windmove-right)
          ([?\s-k] . windmove-up)
          ([?\s-j] . windmove-down)

          ([?\s-H] . windmove-swap-states-left)
          ([?\s-L] . windmove-swap-states-right)
          ([?\s-K] . windmove-swap-states-up)
          ([?\s-J] . windmove-swap-states-down)

          ([?\C-\s-h] . enlarge-window-horizontally)
          ([?\C-\s-l] . shrink-window-horizontally)

          ;; Launch applications via shell command
          ;; ([?\s- ] . (lambda (command)
          ;;              (interactive (list (read-shell-command "$ ")))
          ;;              (start-process-shell-command command nil command)))

          ;; Switch workspace
          ([?\s-w] . exwm-workspace-switch)

          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "s-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))))
  (exwm-enable))
