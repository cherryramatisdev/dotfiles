(require 'vertico)
(require 'savehist)
(require 'marginalia)
(require 'orderless)

(setq-default vertico-cycle t)
(vertico-mode)

(savehist-mode)

(setq-default marginalia-annotators '(marginalia-annotators-heavy marginalia-annotators-light nil))
(marginalia-mode)

(setq completion-styles '(orderless))
