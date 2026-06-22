local lsp = require("lsp")
local lsp_config = vim.lsp

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
  pattern = { "grammar.js", "corpus/*.txt" },
  callback = function()
    vim.cmd("setfiletype tree-sitter-grammar")
  end,
})

vim.api.nvim_create_autocmd({ "BufReadPost" }, {
  pattern = { "grammar.js" },
  command = "set syntax=javascript",
})

lsp_config.config('lua_ls', {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
  settings = {
    Lua = {
      diagnostics = { globals = { "vim", "it", "describe", "before_each" } },
      telemetry = { enable = false },
    },
  },
})

lsp_config.config('yamlls', {
  capabilities = lsp.capabilities,
  on_attach = function(client, bufnr)
    client.server_capabilities.documentFormattingProvider = true
    lsp.on_attach(client, bufnr)
  end,
  settings = {
    yaml = {
      format = { enable = true },
      schemas = {
        ["https://raw.githubusercontent.com/docker/cli/master/cli/compose/schema/data/config_schema_v3.10.json"] =
        "*-compose.yaml",
      },
    },
  },
})

lsp_config.config('jsonls', {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

lsp_config.config('html', {
  capabilities = lsp.capabilities,
  on_attach = lsp.on_attach,
})

lsp_config.config('sqlls', {
  cmd = { "sql-language-server", "up", "--method", "stdio" },
  on_attach = lsp.on_attach,
  filetypes = { "sql", "mysql", "pgsql" },
  root_dir = function(fname)
    return vim.fs.root(fname, '.git') or vim.uv.os_homedir() ---@diagnostic disable-line: undefined-field
  end,
})

local servers = { "bashls", "dockerls", "gopls", "clangd" }
for _, server in pairs(servers) do
  lsp_config.config(server, { capabilities = lsp.capabilities, on_attach = lsp.on_attach })
end

vim.lsp.enable({ "lua_ls", "yamlls", "jsonls", "html", "sqlls", "bashls", "dockerls", "gopls", "clangd" })
