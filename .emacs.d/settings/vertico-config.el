(require 'vertico)
(require 'savehist)
(require 'marginalia)

(setq vertico-cycle t)
(vertico-mode)

(savehist-mode)

(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode)
