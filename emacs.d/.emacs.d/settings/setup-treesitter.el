(require 'tree-sitter)
(require 'tree-sitter-langs)

(tree-sitter-require 'tsx)
(add-to-list 'tree-sitter-major-mode-language-alist '(typescript-tsx-mode . tsx))

(global-tree-sitter-mode)
(add-hook 'tree-sitter-after-on-hook #'tree-sitter-hl-mode)

(provide 'setup-treesitter)
