-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    -- Packer can manage itself
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
end)
