return {
  'goolord/alpha-nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
    'nvim-lua/plenary.nvim'
  },
  config = function()
    local header = {
      type = "text",
      val = {
        "  ⢀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⠀⠀",
        "⢸⣍⡙⢿⣏⠉⠉⠉⠋⠉⠉⣩⣾⢋⣩⡇",
        "⢸⡈⢿⣦⡙⢳⣄⠀⠀⣠⡶⢋⣵⡿⢃⡇",
        "⢸⣙⠿⣮⢋⢷⡝⣣⠸⣫⡴⢛⣵⡾⢋⡇",
        "⢸⣝⢿⣮⣜⢷⢸⢋⡄⣫⡶⣃⣵⡾⣫⡇",
        "⢸⠙⢶⣭⢚⠷⢰⣯⢆⣩⡾⣃⣭⡶⠋⡇",
        "⢸⠀⠳⣾⣘⡃⠰⡣⢋⣵⠞⡃⣽⡶⠀⡇",
        "⢸⠀⠐⠾⡍⡃⡺⢞⣁⠶⣛⢭⡷⠂⠀⡇",
        "⠘⠤⣀⠙⠶⠆⣚⠽⢐⣫⠍⠶⠊⣀⠤⠃",
        "⠀⠀⠈⠙⢫⣬⣖⠃⠙⢊⣚⡋⠊⠁⠀⠀",
        "⠀⠀⠀⠀⠀⠀⠈⠙⠋⠁⠀⠀⠀⠀⠀⠀",
        "    SASAGEYO!   ",
      },
      opts = {
        position = "center",
        hl = "Type",
        wrap = "nowrap",
      },
    }

    local dashboard = require('alpha.themes.dashboard');
    local theme = require('alpha.themes.theta');
    theme.file_icons.enabled = false
    local buttons = {
      type = "group",
      val = {
        { type = "text",    val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
        { type = "padding", val = 1 },
        -- dashboard.button("e", "  New file", "<cmd>ene<CR>"),
        dashboard.button("SPC f f", "󰈞  Find file"),
        dashboard.button("SPC l g", "󰊄  Live grep"),
        -- open buffer with a message on the footer after switching to the learning directory
        dashboard.button("l", "  Learn",
          "<cmd>cd ~/Developer/Learn/ <CR> <cmd>echo 'Switched to Learning directory' <CR>"),
        dashboard.button("w", "  Work", "<cmd>cd ~/Developer/Work/ <CR> <cmd>echo 'Switched to Evolution directory' <CR>"),
        dashboard.button("c", "  Configuration",
          "<cmd>cd ~/.config/nvim/ <CR> <cmd>echo 'Switched to Configuration directory' <CR>"),
        dashboard.button("u", "  Update plugins", "<cmd>Lazy sync<CR>"),
        dashboard.button("q", "󰅚  Quit", "<cmd>qa<CR>"),
      },
      position = "center",
    }

    local section_mru = {
      type = "group",
      val = {
        {
          type = "text",
          val = "Recent files",
          opts = {
            hl = "SpecialComment",
            shrink_margin = false,
            position = "center",
          },
        },
        { type = "padding", val = 1 },
        {
          type = "group",
          val = function()
            return { theme.mru(0, vim.fn.getcwd()) }
          end,
          opts = { shrink_margin = false },
        },
      },
    }


    theme.config = {
      layout = {
        { type = "padding", val = 2 },
        header,
        { type = "padding", val = 2 },
        section_mru,
        { type = "padding", val = 2 },
        buttons,
      },
      theme.config.opts
    }
    require 'alpha'.setup(theme.config)
  end
};
