(require 'cherry-utils)

(cherry/disable "menu")
(cherry/disable "scroll")
(cherry/disable "tool")

(load-theme 'wombat t)

(setq font "Monospace-16")

(set-face-attribute 'default nil :font font)
(set-frame-font font nil t)

(provide 'config-ui)
