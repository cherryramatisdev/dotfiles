vim.opt.completeopt = "menu,menuone,noselect"

local ok, cmp = pcall(require, "cmp")

if not ok then
  return
end

cmp.setup {
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  mapping = {
    ["<C-d>"] = cmp.mapping.scroll_docs(-4),
    ["<C-f>"] = cmp.mapping.scroll_docs(4),
    ["<C-Space>"] = cmp.mapping.complete(),
    ["<C-e>"] = cmp.mapping.close(),
    ["<CR>"] = cmp.mapping.confirm { select = true },
    ["<C-l>"] = cmp.mapping.confirm { select = true },
    ["<C-j>"] = cmp.mapping.select_next_item(),
    ["<C-k>"] = cmp.mapping.select_prev_item(),
  },
  sources = {
    { name = "nvim_lsp" },
    { name = "luasnip" },
    { name = "buffer" },
  },
}

local on_attach = function(client, bufnr)
  -- disable tsserver formatting if you plan on formatting via null-ls
  client.resolved_capabilities.document_formatting = false
  client.resolved_capabilities.document_range_formatting = false
  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function buf_set_option(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

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
    eslint_bin = "eslint",
    eslint_enable_diagnostics = false,
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
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lo", ":TSLspOrganize<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lR", ":TSLspRenameFile<CR>", opts)
  vim.api.nvim_buf_set_keymap(bufnr, "n", "<space>lI", ":TSLspImportAll<CR>", opts)

  -- Mappings.
  local opts = { noremap = true, silent = true }

  -- See `:help vim.lsp.*` for documentation on any of the below functions
  buf_set_keymap("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
  buf_set_keymap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  buf_set_keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  buf_set_keymap("n", "<space>lr", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  buf_set_keymap("n", "<space>ls", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
  buf_set_keymap("n", "<space>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  buf_set_keymap("n", "<space>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  -- buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
  buf_set_keymap("n", "gR", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  buf_set_keymap("n", "<space>k", "<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>", opts)
  buf_set_keymap("n", "[d", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>", opts)
  buf_set_keymap("n", "]d", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>", opts)
  buf_set_keymap("n", "<space>Q", "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", opts)
end

require("null-ls").config {
  sources = { require("null-ls").builtins.formatting.stylua },
}
require("lspconfig")["null-ls"].setup {}

require("lspinstall").setup()

local servers = require("lspinstall").installed_servers()

for _, server in pairs(servers) do
  require("lspconfig")[server].setup {
    on_attach = on_attach,
    capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
    settings = {
      Lua = {
        diagnostics = {
          globals = { "vim", "use" },
        },
      },
    },
  }
end
