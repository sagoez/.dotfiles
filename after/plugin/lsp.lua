-- LSP mappings
vim.keymap.set("n", "gd",  vim.lsp.buf.definition)
vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, { noremap=true, silent=true, buffer=bufnr })
vim.keymap.set("n", "K",  vim.lsp.buf.hover)
vim.keymap.set("n", "gi", vim.lsp.buf.implementation)
vim.keymap.set("n", "gr", vim.lsp.buf.references)
vim.keymap.set("n", "gds", vim.lsp.buf.document_symbol)
vim.keymap.set("n", "gws", vim.lsp.buf.workspace_symbol)
vim.keymap.set("n", "<leader>cl", vim.lsp.codelens.run)
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help)
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.formatting)
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action)
vim.keymap.set({"n", "v"}, "<leader>lca", "<cmd>Lspsaga code_action<CR>")
vim.keymap.set("n", "lgr", "<cmd>Lspsaga rename ++project<CR>")

-- all workspace diagnostics
vim.keymap.set("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
vim.keymap.set("n", "<leader>ae", function()
  vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
vim.keymap.set("n", "<leader>aw", function()
  vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
vim.keymap.set("n", "<leader>d", vim.diagnostic.setloclist)

vim.keymap.set("n", "[c", function()
  vim.diagnostic.goto_prev({ wrap = false })
end)

vim.keymap.set("n", "]c", function()
  vim.diagnostic.goto_next({ wrap = false })
end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
vim.keymap.set("n", "<leader>dc", function()
  require("dap").continue()
end)

vim.keymap.set("n", "<leader>dr", function()
  require("dap").repl.toggle()
end)

vim.keymap.set("n", "<leader>dK", function()
  require("dap.ui.widgets").hover()
end)

vim.keymap.set("n", "<leader>dt", function()
  require("dap").toggle_breakpoint()
end)

vim.keymap.set("n", "<leader>dso", function()
  require("dap").step_over()
end)

vim.keymap.set("n", "<leader>dsi", function()
  require("dap").step_into()
end)

vim.keymap.set("n", "<leader>dl", function()
  require("dap").run_last()
end)

-- completion related settings
-- This is similiar to what I use
local cmp = require("cmp")
cmp.setup({
  sources = {
    { name = "nvim_lsp" },
    { name = "vsnip" },
  },
  snippet = {
    expand = function(args)
      -- Comes from vsnip
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  mapping = cmp.mapping.preset.insert({
    -- None of this made sense to me when first looking into this since there
    -- is no vim docs, but you can't have select = true here _unless_ you are
    -- also using the snippet stuff. So keep in mind that if you remove
    -- snippets you need to remove this select
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
    -- I use tabs... some say you should stick to ins-completion but this is just here as an example
    ["<Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      else
        fallback()
      end
    end,
    ["<S-Tab>"] = function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      else
        fallback()
      end
    end,
  }),
})

