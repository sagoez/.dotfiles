require("mason").setup({
  automatic_installation = true,
  ui = {
    icons = {
      package_installed = "✓",
      package_pending = "➜",
      package_uninstalled = "✗"
    }
  }
})
require("mason-lspconfig").setup {
  ensure_installed = {
    "bashls",
    "dockerls",
    "html",
    "jsonls",
    "lua_ls",
    "rust_analyzer",
    "yamlls",
  }
}
