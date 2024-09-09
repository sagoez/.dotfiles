return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    { "hrsh7th/cmp-buffer" },
    { "hrsh7th/cmp-nvim-lsp" },
    { "hrsh7th/cmp-path" },
    { "hrsh7th/cmp-vsnip" },
    { "hrsh7th/vim-vsnip" },
    { "hrsh7th/cmp-nvim-lsp-signature-help" },
  },

  config = function()
    local cmp = require("cmp")

    cmp.setup({
      sources = {
        { name = "supermaven",             priority = 10 },
        { name = "nvim_lsp" },
        { name = "buffer" },
        { name = "vsnip" },
        { name = "path" },
        { name = "nvim_lsp_signature_help" },
      },
      snippet = {
        expand = function(args)
          -- Comes from vsnip
          vim.fn["vsnip#anonymous"](args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        ["<Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
        ["<C-Space>"] = cmp.mapping.complete(),
        ["<S-Tab>"] = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      }),
    })
  end
}
