;; Kill buffer and window
(defun cherry:kill-buffer ()
  "Run `kill-buffer' and if has another window, run `delete-window' too."
  (interactive)
  (if (eq (one-window-p) nil)
      (progn
        (kill-buffer)
        (delete-window))
    (progn (kill-buffer))))

(global-set-key (kbd "C-x k") 'cherry:kill-buffer)

(provide 'buffer-management)
