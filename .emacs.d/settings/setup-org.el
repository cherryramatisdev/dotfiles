(defun myorg-update-parent-cookie ()
  (when (equal major-mode 'org-mode)
    (save-excursion
      (ignore-errors
        (org-back-to-heading)
        (org-update-parent-todo-statistics)))))

(defadvice org-kill-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(defadvice kill-whole-line (after fix-cookies activate)
  (myorg-update-parent-cookie))

(setq org-agenda-files '("~/org"))
(setq org-directory "~/org")
(setq org-log-done 'time)
(setq org-default-notes-file (concat org-directory "/notes.org"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/todo.org" "Tasks")
         "* TODO %?\nSCHEDULED: %^t")
        ("m" "Meetings" entry (file+headline "~/org/meetings.org" "Tasks")
         "* TODO %?\nSCHEDULED: %^t\nLink To: %^{TEXT}")))

(setq org-agenda-custom-commands
	'(("h" "Hagens Projects"
	   ((tags-todo "cdc")
            (tags-todo "conductor")
            (tags-todo "btr")))
          ("l" "Lami Projects"
           ((tags-todo "lami")))))

(define-key global-map (kbd "C-c c") 'org-capture)
(define-key global-map (kbd "C-c a") 'org-agenda)

;; Trying out org agenda notifications! :D

(require 'appt)
(require 'notifications)
(setq appt-time-msg-list nil)    ;; clear existing appt list
(setq appt-display-interval '10) ;; warn every 10 minutes from t - appt-message-warning-time
(setq
  appt-message-warning-time '10  ;; send first warning 10 minutes before appointment
  appt-display-mode-line nil     ;; don't show in the modeline
  appt-display-format 'window)   ;; pass warnings to the designated window function
(appt-activate 1)                ;; activate appointment notification

(org-agenda-to-appt)             ;; generate the appt list from org agenda files on emacs launch
(run-at-time "24:01" 3600 'org-agenda-to-appt)           ;; update appt list hourly
(add-hook 'org-finalize-agenda-hook 'org-agenda-to-appt) ;; update appt list on agenda view

(defun my-appt-send-notification (title msg)
  (notifications-notify :title title
                        :body msg
                        :app-name "Emacs: Org"))

(defun my-appt-display (min-to-app new-time msg)
  (my-appt-send-notification 
    (format "'Appointment in %s minutes'" min-to-app)    ;; passed to -title in terminal-notifier call
    (format "'%s'" msg)))                                ;; passed to -message in terminal-notifier call
(setq appt-disp-window-function (function my-appt-display))

;; Configure org babel execute
(custom-set-variables
 '(org-babel-load-languages (quote ((emacs-lisp . t) (shell . t))))
 '(org-confirm-babel-evaluate nil))

(provide 'setup-org)
