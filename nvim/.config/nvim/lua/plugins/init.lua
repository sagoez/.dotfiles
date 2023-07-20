return {
  { "j-hui/fidget.nvim",                tag = "legacy" },
  { "folke/neodev.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "folke/todo-comments.nvim" },
  { "dstein64/vim-startuptime",         cmd = "StartupTime" },
  { "nvim-tree/nvim-web-devicons",      lazy = true },
  { "machakann/vim-sandwich" },
  { "neovim/nvim-lspconfig" },
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  { "simrat39/rust-tools.nvim" },
  {
    "scalameta/nvim-metals",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  },
  {
    'kevinhwang91/nvim-bqf',
    dependencies = {
      'junegunn/fzf',
    }
  },
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
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
  { "stevearc/dressing.nvim",  event = "VeryLazy" },
  { "wakatime/vim-wakatime" },
  { "windwp/nvim-autopairs" },
  { "github/copilot.vim" },
}
