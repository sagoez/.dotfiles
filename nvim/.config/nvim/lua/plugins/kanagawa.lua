return {
  "rebelot/kanagawa.nvim",
  lazy = true,
  priority = 1000,
  config = function()
    require("kanagawa").setup({
      colors = {
        theme = {
          all = {
            ui = {
              bg_gutter = "none",
            }
          }
        }
      },
      compile = true,
      dimInactive = false,
      transparent = true,
      background = { light = "lotus", dark = "dragon" },
      overrides = function(colors)
        local theme = colors.theme
        return {
          TelescopeTitle = { fg = theme.ui.special, bold = true },
          TelescopePromptNormal = { bg = theme.ui.bg_p1 },
          TelescopePromptBorder = { fg = theme.ui.bg_p1, bg = theme.ui.bg_p1 },
          TelescopeResultsNormal = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m1 },
          TelescopeResultsBorder = { fg = theme.ui.bg_m1, bg = theme.ui.bg_m1 },
          TelescopePreviewNormal = { bg = theme.ui.bg_dim },
          TelescopePreviewBorder = { bg = theme.ui.bg_dim, fg = theme.ui.bg_dim },
          NormalFloat = { bg = "none" },
          FloatBorder = { bg = "none" },
          LazyNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          MasonNormal = { bg = theme.ui.bg_m3, fg = theme.ui.fg_dim },
          Pmenu = { fg = theme.ui.shade0, bg = theme.ui.bg_p1 },
          PmenuSel = { fg = "NONE", bg = theme.ui.bg_p2 },
          PmenuSbar = { bg = theme.ui.bg_m1 },
          PmenuThumb = { bg = theme.ui.bg_p2 },
          NormalDark = { fg = theme.ui.fg_dim, bg = theme.ui.bg_m3 },
        }
      end,
    })
  end
}
