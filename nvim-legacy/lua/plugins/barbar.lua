return {
  'romgrk/barbar.nvim',
  event = "VimEnter",
  dependencies = { 'nvim-tree/nvim-web-devicons', 'lewis6991/gitsigns.nvim' },
  init = function() vim.g.barbar_auto_setup = false end,
  config = function()
    require('barbar').setup({
      auto_hide = 0,
      animation = true,
      clickable = false,
      highlight_alternate = false,
      focus_on_close = 'left',
      icons = {
        diagnostics = {
          [vim.diagnostic.severity.ERROR] = { enabled = true, icon = 'ﬀ' },
          [vim.diagnostic.severity.WARN] = { enabled = true, icon = '' },
          [vim.diagnostic.severity.INFO] = { enabled = false },
          [vim.diagnostic.severity.HINT] = { enabled = true, icon = '' },
        },
        preset = 'powerline',
        inactive = { button = '' --[[ , separator = { left = '', right = ''  ]] },
        current = { button = '' },
        pinned = { button = '' },
      }
    })
  end
}
