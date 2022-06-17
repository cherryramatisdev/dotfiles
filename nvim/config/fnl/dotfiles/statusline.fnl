(module dotfiles.statusline
  {require {nvim aniseed.nvim
            a aniseed.core
            str aniseed.string}})

(def init_group (vim.api.nvim_create_augroup :init_group {:clear false}))
(def reset_group (vim.api.nvim_create_augroup :reset_group {:clear false}))

(vim.api.nvim_create_autocmd 
  [:BufEnter :CursorHold :CursorHoldI] 
  {:desc "word count for the statusline" 
   :pattern ["*.md" "*.txt"]
   :callback (fn []
               (let [wc (a.get (vim.fn.wordcount) :words)]
                 (if (= wc 0)
                   (set nvim.b.wordcount "")
                   (= wc 1)
                   (set nvim.b.wordcount (.. "| " wc " word"))
                   (set nvim.b.wordcount (.. "| " wc " words"))
                   )))
   :group init_group})

(vim.api.nvim_create_autocmd 
  [:BufEnter :CursorHold :FocusGained] 
  {:desc "git branch and LSP errors for the statusline" 
   :callback (fn []
               (when (= (str.trim (vim.fn.system "git rev-parse --is-inside-work-tree")) "true")
                 (let [branch (vim.fn.system "git branch --show-current | tr -d '\n'")]
                   (set nvim.b.branch_name (.. " [" branch "] "))))
               (let [num_errors (length (vim.diagnostic.get 0 {:severity vim.diagnostic.severity.ERROR }))
                     num_warnings (length (vim.diagnostic.get 0 {:severity vim.diagnostic.severity.WARN}))]
                 (when (> num_errors 0)
                   (set nvim.b.errors (.. "  "  num_errors " ")))
                 (when (> num_warnings 0)
                   (set nvim.b.errors (.. nvim.b.errors "  " num_warnings " ")))))
   :group init_group})

(set nvim.o.statusline "%{get(b:, \"branch_name\", \"\")} %{get(b:, \"errors\", \"\")} %{get(b:, \"wordcount\", \"\")}")
