vim.g.mapleader = " "

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require('configuration.remap')
require('configuration.set')
require('lazy').setup('plugins')
require('lsp').setup()

if vim.g.neovide then
  -- Neovide configuration for transparency
  local alpha = function()
    return string.format("%x", math.floor((255 * vim.g.transparency) or 0.8))
  end

  vim.g.neovide_transparency = 0.6
  vim.g.transparency = 1
  vim.g.neovide_window_blurred = true
  vim.g.neovide_background_color = "#0f1117" .. alpha()
  vim.g.neovide_show_border = false
  vim.opt.linespace = 0

  -- Font configuration
  vim.opt.guifont = "FiraCode Nerd Font:h18"

  -- Keybindings for clipboard
  vim.keymap.set(
    { 'n', 'v', 's', 'x', 'o', 'i', 'l', 'c', 't' },
    '<D-v>',
    function() vim.api.nvim_paste(vim.fn.getreg('+'), true, -1) end,
    { noremap = true, silent = true }
  )
end

vim.cmd("colorscheme kanagawa")
