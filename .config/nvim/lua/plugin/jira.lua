-- Basics
vim.keymap.nnoremap { "<leader>vb", [[:ViraBrowse<cr>]] }
vim.keymap.nnoremap { "<leader>vc", [[:ViraComment<cr>]] }
vim.keymap.nnoremap { "<leader>vi", [[:ViraIssues<cr>]] }
vim.keymap.nnoremap { "<leader>vr", [[:ViraReport<cr>]] }
vim.keymap.nnoremap { "<leader>vt", [[:ViraTodos<cr>]] }

-- Sets
vim.keymap.nnoremap { "<leader>vsa", [[:ViraSetAssignee<cr>]] }
vim.keymap.nnoremap { "<leader>vsp", [[:ViraSetPriority<cr>]] }
vim.keymap.nnoremap { "<leader>vss", [[:ViraSetStatus<cr>]] }
vim.keymap.nnoremap { "<leader>vse", [[:ViraSetEpic<cr>]] }
vim.keymap.nnoremap { "<leader>vsv", [[:ViraSetVersion<cr>]] }

-- Filter search
vim.keymap.nnoremap { "<leader>vfR", [[:ViraFilterReset<cr>]] }
vim.keymap.nnoremap { "<leader>v/ ", [[:ViraFilterText<cr>]] }
vim.keymap.nnoremap { "<leader>vfP", [[:ViraFilterPriorities<cr>]] }
vim.keymap.nnoremap { "<leader>vfa", [[:ViraFilterAssignees<cr>]] }
vim.keymap.nnoremap { "<leader>vfe", [[:ViraFilterEpics<cr>]] }
vim.keymap.nnoremap { "<leader>vfp", [[:ViraFilterProjects<cr>]] }
vim.keymap.nnoremap { "<leader>vfr", [[:ViraFilterReporter<cr>]] }
vim.keymap.nnoremap { "<leader>vfs", [[:ViraFilterStatuses<cr>]] }
vim.keymap.nnoremap { "<leader>vft", [[:ViraFilterTypes<cr>]] }
