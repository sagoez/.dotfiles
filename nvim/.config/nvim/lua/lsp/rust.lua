local lsp = require("lsp")

vim.g.rustaceanvim = {
  tools = {
    hover_with_actions = false,
    reload_workspace_from_cargo_toml = true,
    inlay_hints = {
      only_current_line = false,
      show_parameter_hints = true,
      parameter_hints_prefix = " <- ",
      other_hints_prefix = "=> ",
      max_len_align = false,
      max_len_align_padding = 1,
      right_align = false,
      right_align_padding = 7,
      highlight = "Comment",
    },
  },
  server = {
    on_attach = lsp.on_attach,
    settings = {
      ["rust-analyzer"] = {
        checkOnSave = {
          command = "clippy",
        },
        rustfmt = {
          extraArgs = { "+nightly" },
        },
      },
    },
  },
}
