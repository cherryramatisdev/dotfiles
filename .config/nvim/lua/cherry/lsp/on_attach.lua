local M = {}

function M:general_settings(_, bufnr)
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<leader>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<leader>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<leader>k", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "<C-j>", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "<C-k>", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<leader>Q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

function M:ts_settings(client, bufnr)
  -- disable tsserver formatting if you plan on formatting via null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false

  local ts_utils = require "nvim-lsp-ts-utils"

  -- defaults
  ts_utils.setup {
    debug = false,
    disable_commands = false,
    enable_import_on_completion = false,

    -- import all
    import_all_timeout = 5000, -- ms
    import_all_priorities = {
      buffers = 4, -- loaded buffer names
      buffer_content = 3, -- loaded buffer content
      local_files = 2, -- git files or files with relative path markers
      same_file = 1, -- add to existing import statement
    },
    import_all_scan_buffers = 100,
    import_all_select_source = false,

    -- eslint
    eslint_enable_code_actions = true,
    eslint_enable_disable_comments = true,
    eslint_bin = "eslint_d",
    eslint_enable_diagnostics = true,
    eslint_opts = {},

    -- formatting
    enable_formatting = true,
    formatter = "prettier",
    formatter_opts = {},

    -- update imports on file move
    update_imports_on_move = false,
    require_confirmation_on_move = false,
    watch_dir = nil,

    -- filter diagnostics
    filter_out_diagnostics_by_severity = {},
    filter_out_diagnostics_by_code = {},
  }

  -- required to fix code action ranges and filter diagnostics
  ts_utils.setup_client(client)

  -- no default maps, so you may want to define some here
  local opts = { silent = true }
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lo", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lR", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<leader>lI", ":TSLspImportAll<CR>", opts)
end

return M
