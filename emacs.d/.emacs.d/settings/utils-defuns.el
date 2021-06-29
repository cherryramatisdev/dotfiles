(defun kill-region-or-backward-word ()
  (interactive)
  (if (region-active-p)
      (kill-region (region-beginning) (region-end))
    (backward-kill-word 1)))

(defun open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun open-line-above ()
  (interactive)
  (beginning-of-line)
  (newline)
  (forward-line -1)
  (indent-for-tab-command))

(defun new-line-dwim ()
  (interactive)
  (let ((break-open-pair (or (and (looking-back "{" 1) (looking-at "}"))
                             (and (looking-back ">" 1) (looking-at "<"))
                             (and (looking-back "(" 1) (looking-at ")"))
                             (and (looking-back "\\[" 1) (looking-at "\\]")))))
    (newline)
    (when break-open-pair
      (save-excursion
        (newline)
        (indent-for-tab-command)))
    (indent-for-tab-command)))

(defun duplicate-region (&optional num start end)
  "Duplicates the region bounded by START and END NUM times.
If no START and END is provided, the current region-beginning and
region-end is used."
  (interactive "p")
  (save-excursion
    (let* ((start (or start (region-beginning)))
           (end (or end (region-end)))
           (region (buffer-substring start end)))
      (goto-char end)
      (dotimes (i num)
        (insert region)))))

(defun duplicate-current-line-or-region (arg)
  "Duplicates the current line or region ARG times.
If there's no region, the current line will be duplicated."
  (interactive "p")
  (if (region-active-p)
      (let ((beg (region-beginning))
            (end (region-end)))
        (duplicate-region arg beg end)
        (one-shot-keybinding "d" (lambda () (duplicate-region 1 beg end))))
    (duplicate-current-line arg)
    (one-shot-keybinding "d" 'duplicate-current-line)))

(defun cherry/switch-language ()
  "Switch language from a list of choices using setxkbmap"
  (interactive)
  (let ((choices '("us" "br")))
    (shell-command (format "/usr/bin/setxkbmap -layout %s" (ido-completing-read "Choose language: " choices)))))

(defun cherry/work-setup ()
  "Setup work browsers from i3"
  (interactive)
  (let ((choices '("personal" "hagens" "lami")))
    (shell-command (format "work-setup %s" (ido-completing-read "Choose enterprise: " choices)))))

(defun cherry/load-theme ()
  "Choose between 'modus-vivendi' and 'modus-operandi' with better names(dark and light)"
  (interactive)
  (let ((choice (ido-completing-read "Choose theme: " '("dark" "light"))))
    (cond
     ((equal choice "dark") (load-theme 'modus-vivendi t))
     ((equal choice "light") (load-theme 'modus-operandi t)))))

(provide 'utils-defuns)
