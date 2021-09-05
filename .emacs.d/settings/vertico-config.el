(require 'vertico)
(require 'savehist)
(require 'marginalia)
(require 'orderless)

(setq completion-styles '(orderless))

(setq vertico-cycle t)
(vertico-mode)

(savehist-mode)

(setq marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode)
