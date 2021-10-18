-- Basics
vim.api.nvim_set_keymap("n", "<leader>vb", ":ViraBrowse<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vc", ":ViraComment<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vi", ":ViraIssues<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vr", ":ViraReport<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vt", ":ViraTodos<cr>", { noremap = true })

-- Sets
vim.api.nvim_set_keymap("n", "<leader>vsa", ":ViraSetAssignee<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vsp", ":ViraSetPriority<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vss", ":ViraSetStatus<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vse", ":ViraSetEpic<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vsv", ":ViraSetVersion<cr>", { noremap = true })

-- Filter search
vim.api.nvim_set_keymap("n", "<leader>vfR", ":ViraFilterReset<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>v/ ", ":ViraFilterText<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfP", ":ViraFilterPriorities<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfa", ":ViraFilterAssignees<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfe", ":ViraFilterEpics<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfp", ":ViraFilterProjects<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfr", ":ViraFilterReporter<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vfs", ":ViraFilterStatuses<cr>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>vft", ":ViraFilterTypes<cr>", { noremap = true })
