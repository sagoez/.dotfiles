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
      -- maximum_padding = math.huge,
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
        --   -- separator = { left = '', right = '' },
      }
    })
  end,
  version = '^1.0.0', -- optional: only update when a new 1.x version is released
}
