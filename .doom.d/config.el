(setq user-full-name "Cherry Ramatis"
      user-mail-address "cherry.ramatis@lamimed.it")

(setq doom-font (font-spec :family "monospace" :size 17 :weight 'semi-light)
      doom-variable-pitch-font (font-spec :family "sans" :size 17))

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

(setq evil-split-window-below t
      evil-vsplit-window-right t)

(setq org-directory "~/projects/dotfiles/tasks/")

(remove-hook 'doom-first-input-hook #'evil-snipe-mode)

(add-hook 'typescript-tsx-mode-hook 'prettier-js-mode)
(add-hook 'typescript-mode-hook 'prettier-js-mode)

(setq +mu4e-gmail-accounts '(("cherry.ramatis@gmail.com" . "/personal")
                             ("cherry.ramatis@lamimed.it" . "/work")))

;; don't need to run cleanup after indexing for gmail
(setq mu4e-index-cleanup nil
      ;; because gmail uses labels as folders we can use lazy check since
      ;; messages don't really "move"
      mu4e-index-lazy-check t)

(defun cherry/exwm-init-hook ()
  ;; Make workspace 1 be the one where we land at startup
  (exwm-workspace-switch-create 1)

  ;; Show battery status in the mode line
  (display-battery-mode 1)

  ;; Show the time and date in modeline
  (setq display-time-day-and-date t)
  (display-time-mode 1))

(defun cherry/exwm-update-class ()
  (exwm-workspace-rename-buffer exwm-class-name))

(defun cherry/exwm-update-title ()
  (pcase exwm-class-name
    ("Firefox" (exwm-workspace-rename-buffer (format "Firefox: %s" exwm-title)))))

(use-package! exwm
  :config
  ;; Set the default number of workspaces
  (setq exwm-workspace-number 5)

  ;; When window "class" updates, use it to set the buffer name
  (add-hook 'exwm-update-class-hook #'cherry/exwm-update-class)

  ;; When window title updates, use it to set the buffer name
  (add-hook 'exwm-update-title-hook #'cherry/exwm-update-title)

  (add-hook 'exwm-mode-hook #'doom-mark-buffer-as-real-h)

  ;; When EXWM starts up, do some extra confifuration
  (add-hook 'exwm-init-hook #'cherry/exwm-init-hook)

  ;; NOTE: Uncomment the following two options if you want window buffers
  ;;       to be available on all workspaces!

  ;; Automatically move EXWM buffer to current workspace when selected
  (setq exwm-layout-show-all-buffers t)

  ;; Display all EXWM buffers in every workspace buffer list
  (setq exwm-workspace-show-all-buffers t)

  ;; Set the screen resolution (update this to be the correct resolution for your screen!)
  (require 'exwm-randr)
  (exwm-randr-enable)
  (start-process-shell-command "xrandr" nil "xrandr --output eDP --primary --mode 1266x768 --pos 0x0 --rotate normal")

  ;; This will need to be updated to the name of a display!  You can find
  ;; the names of your displays by looking at arandr or the output of xrandr
  (setq exwm-randr-workspace-monitor-plist '(1 "eDP"))

  ;; Load the system tray before exwm-init
  (require 'exwm-systemtray)
  (setq exwm-systemtray-height 32)
  (exwm-systemtray-enable)

  ;; Automatically send the mouse cursor to the selected workspace's display
  (setq exwm-workspace-warp-cursor t)

  ;; Window focus should follow the mouse pointer
  (setq mouse-autoselect-window t
        focus-follows-mouse t)

  ;; These keys should always pass through to Emacs
  (setq exwm-input-prefix-keys
    '(?\C-x
      ?\C-h
      ?\M-x
      ?\M-`
      ?\M-&
      ?\M-:
      ?\M-h
      ?\M-j
      ?\M-k
      ?\M-l
      ?\C-\  ;; Ctrl+Space
      ))

  ;; Ctrl+Q will enable the next key to be sent directly
  (define-key exwm-mode-map [?\C-q] 'exwm-input-send-next-key)

  (defun cherry/split-right ()
    (interactive)
    (split-window-right)
    (switch-to-buffer "*scratch*"))

  (defun cherry/split-below ()
    (interactive)
    (split-window-below)
    (switch-to-buffer "*scratch*"))

  (defun cherry/open-term ()
    (interactive)
    (start-process-shell-command "alacritty" nil "alacritty"))

  (defun cherry/open-browser ()
    (interactive)
    (start-process-shell-command "qutebrowser" nil "qutebrowser"))

  (defun cherry/kill ()
    (interactive)
    (if (not (one-window-p))
        (progn
          (kill-current-buffer)
          (delete-window))
      (kill-current-buffer)))

  (global-set-key (kbd "M-h") 'windmove-left)
  (global-set-key (kbd "M-j") 'windmove-down)
  (global-set-key (kbd "M-k") 'windmove-up)
  (global-set-key (kbd "M-l") 'windmove-right)

  ;; Set up global key bindings.  These always work, no matter the input state!
  ;; Keep in mind that changing this list after EXWM initializes has no effect.
  (setq exwm-input-global-keys
        `(
          ;; Reset to line-mode (C-c C-k switches to char-mode via exwm-input-release-keyboard)
          ([?\s-r] . exwm-reset)

          ;; Move between windows
          ([?\M-h] . windmove-left)
          ([?\M-l] . windmove-right)
          ([?\M-k] . windmove-up)
          ([?\M-j] . windmove-down)

          ([?\M-H] . +evil/window-move-left)
          ([?\M-L] . +evil/window-move-right)
          ([?\M-K] . +evil/window-move-up)
          ([?\M-J] . +evil/window-move-down)

          ([?\s-v] . cherry/split-right)
          ([?\s-s] . cherry/split-right)

          ([?\s-c] . cherry/kill)

          ([?\s-t] . cherry/open-term)
          ([?\s-w] . cherry/open-browser)

          ([?\s-b] . switch-to-buffer)

          ;; Launch applications via shell command
          ([?\s- ] . counsel-linux-app)

          ;; Switch workspace
          ([?\s-W] . exwm-workspace-switch)
          ([?\s-`] . (lambda () (interactive) (exwm-workspace-switch-create 0)))

          ;; 's-N': Switch to certain workspace with Super (Win) plus a number key (0 - 9)
          ,@(mapcar (lambda (i)
                      `(,(kbd (format "M-%d" i)) .
                        (lambda ()
                          (interactive)
                          (exwm-workspace-switch-create ,i))))
                    (number-sequence 0 9))))
  (exwm-enable))

(use-package! desktop-environment
  :after exwm
  :config (desktop-environment-mode)
  :custom
  (desktop-environment-brightness-small-increment "2%+")
  (desktop-environment-brightness-small-decrement "2%-")
  (desktop-environment-brightness-normal-increment "5%+")
  (desktop-environment-brightness-normal-decrement "5%-")
  (desktop-environment-screenshot-command "flameshot gui"))
