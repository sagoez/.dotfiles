return {
  -- { "j-hui/fidget.nvim",                tag = "legacy" },
  { "folke/neodev.nvim" },
  { "williamboman/mason-lspconfig.nvim" },
  { "dstein64/vim-startuptime",         cmd = "StartupTime" },
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
    'junegunn/fzf',
    event = "VeryLazy",
    build = function()
      vim.fn['fzf#install']()
    end
  },
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
  { "stevearc/dressing.nvim",  event = "VeryLazy" },
  { "wakatime/vim-wakatime" },
  { "windwp/nvim-autopairs" },
  { "github/copilot.vim" },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
    build = function() vim.fn["mkdp#util#install"]() end,
  }
}
