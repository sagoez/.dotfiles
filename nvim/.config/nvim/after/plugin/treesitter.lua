require("nvim-treesitter.configs").setup({
    playground = { enable = true },
    auto_install = true,
    query_linter = {
        enable = true,
        use_virtual_text = true,
        lint_events = { "BufWrite", "CursorHold" },
    },
    ensure_installed = "all",
    highlight = {
        enable = true,
        --disable = { "scala" },
    },
})
