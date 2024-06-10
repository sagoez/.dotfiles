return {
  'nvim-treesitter/nvim-treesitter-context',
  config = function()
    require("nvim-treesitter.configs").setup({
      playground = { enable = true },
      query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
      },
      ensure_installed = "all",
      treesitter = {
        enable = false
      },
      highlight = {
        enable = true
      },
      indent = {
        enable = true
      },
      auto_install = false,
      sync_install = false,
      ignore_install = {},
      modules = {}
    })
  end
}
