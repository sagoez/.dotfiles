local api = vim.api
local map = vim.keymap.set

local M = {}

vim.lsp.set_log_level("ERROR")

M.capabilities = require("cmp_nvim_lsp").default_capabilities()

M.on_attach = function(_, bufnr)
  local opts = function(desc) return { buffer = bufnr, desc = desc } end

  map("n", "gd", vim.lsp.buf.definition, opts("Go to definition"))
  map("n", "gtd", vim.lsp.buf.type_definition, opts("Go to type definition"))
  map("n", "K", function() vim.lsp.buf.hover({ border = "single" }) end, opts("Show hover"))
  map("n", "gi", vim.lsp.buf.implementation, opts("Go to implementation"))
  map("n", "gr", vim.lsp.buf.references, opts("Show references"))
  map("n", "<leader>sh", vim.lsp.buf.signature_help, opts("Show signature help"))
  map("n", "<leader>rn", vim.lsp.buf.rename, opts("Rename"))
  map("n", "<leader>ca", vim.lsp.buf.code_action, opts("Code action"))
  map("n", "<leader>cl", vim.lsp.codelens.run, opts("Run code lens"))
  map("n", "<leader>awf", vim.lsp.buf.add_workspace_folder, opts("Add workspace folder"))
  map("n", "<leader>f", function()
    vim.lsp.buf.format({ async = true })
  end, opts("Format"))

  api.nvim_set_option_value("omnifunc", "v:lua.vim.lsp.omnifunc", { buf = bufnr })
end

function M.setup()
  require("lsp.metals")
  require("lsp.rust")
  require("lsp.typescript")
  require("lsp.servers")
end

return M
