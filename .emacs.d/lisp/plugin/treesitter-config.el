(require 'tree-sitter)
(require 'tree-sitter-langs)

(add-hook 'typescript-mode-hook #'tree-sitter-mode)
(add-hook 'typescript-mode-hook #'tree-sitter-hl-mode)

(add-hook 'web-mode-hook #'tree-sitter-mode)
(add-hook 'web-mode-hook #'tree-sitter-hl-mode)
