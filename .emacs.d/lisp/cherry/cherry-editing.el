(defun cherry/beginning-of-line ()
  (interactive)
  (move-beginning-of-line 1)
  (indent-for-tab-command)
  )

(defun cherry/open-line-below ()
  (interactive)
  (end-of-line)
  (newline)
  (indent-for-tab-command))

(defun cherry/open-line-above ()
  (interactive)
  (cherry/beginning-of-line)
  (newline)
  (previous-line)
  (indent-for-tab-command))

(defun cherry/copy-line (arg)
  "Copy lines (as many as prefix argument) in the kill ring.
      Ease of use features:
      - Move to start of next line.
      - Appends the copy on sequential calls.
      - Use newline as last char even on the last line of the buffer.
      - If region is active, copy its lines."
  (interactive "p")
  (let ((beg (line-beginning-position))
        (end (line-end-position arg)))
    (when mark-active
      (if (> (point) (mark))
          (setq beg (save-excursion (goto-char (mark)) (line-beginning-position)))
        (setq end (save-excursion (goto-char (mark)) (line-end-position)))))
    (if (eq last-command 'copy-line)
        (kill-append (buffer-substring beg end) (< end beg))
      (kill-ring-save beg end)))
  (kill-append "\n" nil)
  (beginning-of-line (or (and arg (1+ arg)) 2))
  (if (and arg (not (= 1 arg))) (message "%d lines copied" arg)))

(defun cherry/duplicate-line ()
  (interactive)
  (cherry/copy-line 1)
  (yank))

(provide 'cherry-editing)
