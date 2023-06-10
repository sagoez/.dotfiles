local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use { 'wbthomason/packer.nvim' }
  use { 'ThePrimeagen/harpoon' }
  use { 'mbbill/undotree' }
  use { 'tpope/vim-fugitive' }
  use { 'nvim-treesitter/nvim-treesitter-context' }
  use { "j-hui/fidget.nvim" }
  use { "folke/neodev.nvim" }
  use { "nvim-lualine/lualine.nvim",
    requires = { "nvim-tree/nvim-web-devicons", opt = true }
  }
  use { "numToStr/Comment.nvim" }
  use {
    "hrsh7th/nvim-cmp",
    requires = {
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-path" },
      { "hrsh7th/cmp-vsnip" },
      { "hrsh7th/vim-vsnip" },
      { "hrsh7th/cmp-nvim-lsp-signature-help" },
    },
  }
  use { "lewis6991/gitsigns.nvim" }
  use { "kyazdani42/nvim-tree.lua",
    requires = {
      'nvim-tree/nvim-web-devicons',
    }
  }
  use {
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  }
  use { "lukas-reineke/indent-blankline.nvim" }
  use { "folke/todo-comments.nvim" }
  use { "dstein64/vim-startuptime" }
  use { "kosayoda/nvim-lightbulb" }
  use { "kyazdani42/nvim-web-devicons" }
  use { "machakann/vim-sandwich" }
  use { "eandrju/cellular-automaton.nvim" }
  use { "folke/trouble.nvim" }
  use { "neovim/nvim-lspconfig" }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim" },
    },
  }
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use { "simrat39/rust-tools.nvim" }
  use {
    "scalameta/nvim-metals",
    requires = {
      "nvim-lua/plenary.nvim",
      "mfussenegger/nvim-dap",
    },
  }
  use { 'kevinhwang91/nvim-bqf' }
  use {
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("lspsaga")
    end,
    requires = {
      { "nvim-tree/nvim-web-devicons" },
    }
  }
  use { "stevearc/dressing.nvim" }
  use { "rebelot/kanagawa.nvim" }
  use { "wakatime/vim-wakatime" }
  use { "tpope/vim-vinegar" }
  use { "windwp/nvim-autopairs" }
  use { "github/copilot.vim" }
  use { "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = {
      "markdown" } end, ft = { "markdown" }, }
  if packer_bootstrap then
    require('packer').sync()
  end
end)
