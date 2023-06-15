-- Only required if you have packer configured as `opt`
-- vim.cmd.packadd('packer.nvim')
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
	-- use("folke/zen-mode.nvim")
	-- use("github/copilot.vim")
	-- use("theprimeagen/refactoring.nvim")
	-- use("laytan/cloak.nvim")

	-- Simple Plugns
	use 'airblade/vim-rooter'
	use 'ayu-theme/ayu-vim'
	use 'cohama/agit.vim'
	use 'eandrju/cellular-automaton.nvim'
	use 'karb94/neoscroll.nvim'
	use 'mbbill/undotree'
	use 'norcalli/nvim-colorizer.lua'
	use 'nvim-treesitter/nvim-treesitter-context'
	use 'nvim-treesitter/playground'
	use 'theprimeagen/harpoon'
	use 'tpope/vim-commentary'
	use 'tpope/vim-fugitive'
	use 'tpope/vim-repeat'
	use 'tpope/vim-sleuth'
	use 'tpope/vim-surround'
	use 'vim-scripts/SearchComplete'
	use 'wbthomason/packer.nvim'

	-- Lazy Loaded Plugins
	use { 'Xuyuanp/nerdtree-git-plugin', opt = true, cmd = { 'NERDTreeToggle', 'NERDTreeFind' } }

	-- One plugin uses the other, but is lazy loaded
	use { 'nvim-tree/nvim-tree.lua',
		{ 'nvim-tree/nvim-web-devicons', opt = true }
	}

	-- Post-install/update Hook
	-- use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

	-- Use dependency and run lua function after load
	use {
		'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' },
		config = function() require('gitsigns').setup() end
	}

	use {
		'nvim-lualine/lualine.nvim',
		requires = { 'nvim-tree/nvim-web-devicons', opt = true }
	}

	use { 'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.0',
		requires = { { 'nvim-lua/plenary.nvim' } }
	}

	use({
		"folke/trouble.nvim",
		config = function()
			require("trouble").setup {
				icons = true,
			}
		end
	})

	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end, }

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },
			{ 'williamboman/mason.nvim' },
			{ 'williamboman/mason-lspconfig.nvim' },

			-- Autocompletion
			{ 'hrsh7th/nvim-cmp' },
			{ 'hrsh7th/cmp-buffer' },
			{ 'hrsh7th/cmp-path' },
			{ 'saadparwaiz1/cmp_luasnip' },
			{ 'hrsh7th/cmp-nvim-lsp' },
			{ 'hrsh7th/cmp-nvim-lua' },

			-- Snippets
			{ 'L3MON4D3/LuaSnip' },
			{ 'rafamadriz/friendly-snippets' },
		}
	}


	if packer_bootstrap then
		require('packer').sync()
	end
end)
