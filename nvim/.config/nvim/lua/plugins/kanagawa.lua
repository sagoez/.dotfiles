return {
  "rebelot/kanagawa.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require('kanagawa').setup({
      compile = true,
      undercurl = true, -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true },
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,    -- do not set background color
      dimInactive = false,   -- dim inactive window `:h hl-NormalNC`
      terminalColors = true, -- define vim.g.terminal_color_{0,17}
      colors = {             -- add/modify theme and palette colors
        palette = {},
        theme = {
          wave = {},
          lotus = {},
          dragon = {},
          all = {
            ui = {
              bg_gutter = "none",
            },

          }
        },
      },
      overrides = function(colors) -- add/modify highlights
        local theme = colors.theme
        return {
          FloatBorder = { bg = "none" },
          FloatTitle = { bg = "none" },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
          NormalFloat = { bg = "none" },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          TelescopeTitle = { fg = theme.ui.special, bold = true },
        }
      end,
      theme = "wave",  -- Load "wave" theme when 'background' option is not set
      background = {   -- map the value of 'background' option to a theme
        dark = "wave", -- try "dragon" !
        light = "lotus"
      },
    })

    vim.cmd.colorscheme("kanagawa")
    local kanagawa_colors = require("kanagawa.colors").setup()
    vim.cmd(string.format([[hi! StatusLine guifg=%s guibg=%s]], kanagawa_colors.palette.fujiWhite,
      kanagawa_colors.palette.sumiInk3))
  end,
}
