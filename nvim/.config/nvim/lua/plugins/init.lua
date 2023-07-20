return {
  { "j-hui/fidget.nvim",                tag = "legacy" },
  { "folke/neodev.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "folke/todo-comments.nvim" },
  { "dstein64/vim-startuptime",         cmd = "StartupTime" },
  { "nvim-tree/nvim-web-devicons",      lazy = true },
  { "machakann/vim-sandwich" },
  { "eandrju/cellular-automaton.nvim" },
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
  { 'kevinhwang91/nvim-bqf' },
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
  { "tpope/vim-vinegar" },
  { "windwp/nvim-autopairs" },
  { "github/copilot.vim" },
}
