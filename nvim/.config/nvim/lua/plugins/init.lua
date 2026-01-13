return {
  { "folke/neodev.nvim" },
  { "neovim/nvim-lspconfig" },
  -- ERROR: Not working on Rust 1.94+
  -- {
  --   'cordx56/rustowl',
  --   version = '*', -- Latest stable version
  --   build = 'cargo install rustowl',
  --   lazy = false, -- This plugin is already lazy
  --   opts = {
  --     client = {
  --       on_attach = function(_, buffer)
  --         vim.keymap.set('n', '<leader>o', function()
  --           require('rustowl').toggle(buffer)
  --         end, { buffer = buffer, desc = 'Toggle RustOwl' })
  --       end
  --     },
  --   },
  -- },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  {
    'mrcjkb/rustaceanvim',
    version = '^6',
    lazy = false,
  },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  },
  {
    'junegunn/fzf',
    event = "VeryLazy",
    build = function()
      vim.fn['fzf#install']()
    end
  },
  { "github/copilot.vim" },
  {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
  },
  {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga")
    end,
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
    }
  },
  { "stevearc/dressing.nvim", event = "VeryLazy" },
  { "wakatime/vim-wakatime" },
  { "windwp/nvim-autopairs" }
}
