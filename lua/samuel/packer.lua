-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}
	use{ -- Theme inspired by Atom
	'navarasu/onedark.nvim',
	config = function()
		vim.cmd.colorscheme 'onedark'
	end}
	use	{ -- Highlight, edit, and navigate code
	'nvim-treesitter/nvim-treesitter',
	dependencies = {
		'nvim-treesitter/nvim-treesitter-textobjects',
	},
	config = function()
		pcall(require('nvim-treesitter.install').update { with_sync = true })
	end}
	use { 'ThePrimeagen/harpoon' }
	use { 'mbbill/undotree' }
	use { 'tpope/vim-fugitive' }
	use {
		"hrsh7th/nvim-cmp",
		requires = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/cmp-vsnip" },
			{ "hrsh7th/vim-vsnip" },
            { "hrsh7th/cmp-path" },
            { "hrsh7th/cmp-buffer" },
		},
	}
    use { "neovim/nvim-lspconfig"}
    use { "simrat39/rust-tools.nvim"}
	use {
		"scalameta/nvim-metals",
		requires = {
			"nvim-lua/plenary.nvim",
			"mfussenegger/nvim-dap",
		},
	}
    use {'nvim-lua/plenary.nvim'}
    use {'folke/zen-mode.nvim'}
    use {'kevinhwang91/nvim-bqf'}
    use {
        "glepnir/lspsaga.nvim",
        branch = "main",
        config = function()
            require("lspsaga").setup({})
        end,
        requires = {
            {"nvim-tree/nvim-web-devicons"},
        }
    }
    use {"github/copilot.vim"}
end)
