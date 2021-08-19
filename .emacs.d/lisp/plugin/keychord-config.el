 (require 'key-chord)
 (key-chord-mode 1)

(key-chord-define-global "fg" 'iy-go-to-char)
(key-chord-define-global "fd" 'iy-go-to-char-backward)
(key-chord-define-global "f;" 'iy-go-to-or-up-to-continue)
