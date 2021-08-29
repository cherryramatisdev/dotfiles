(require 'find-file-in-project)

(setq ffip-use-rust-fd t)
(setq ffip-prefer-ido-mode t)

(global-set-key (kbd "C-c p") 'ffip)
