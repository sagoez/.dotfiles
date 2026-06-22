-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.opt.relativenumber = false

-- Use bacon-ls for Rust diagnostics instead of rust-analyzer's checkOnSave.
-- Must be set BEFORE the lang.rust extra loads, so it lives here in options.
vim.g.lazyvim_rust_diagnostics = "bacon-ls"
