-------------------------------------------------------------------------------
-- plugins.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/wbthomason/packer.nvim
local fn = vim.fn

-- automatically install and set up packer.nvim
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system {
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	}
	print "Installing packer close and reopen Neovim..."
	vim.cmd [[packadd packer.nvim]]
end

-- Neovim automatically runs :PackerCompile whenever plugins.lua is updated
vim.cmd [[
	augroup packer_user_config
		autocmd!
		autocmd BufWritePost plugins.lua source <afile> | PackerSync
	augroup end
]]

-- Protected Call
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Floating Window
packer.init {
	display = {
		open_fn = function()
			return require("packer.util").float { border = "rounded" }
		end,
	},
}

return require('packer').startup(function(use)

	-- Default Plugins
	use "wbthomason/packer.nvim" -- have packer manage itself
	use "nvim-lua/popup.nvim" -- an implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- useful lua functions used ny lots of plugins

	-- My plugins here
	-- Auto-Complete tool
	use "hrsh7th/nvim-cmp" -- completion engine plugin for neovim written in Lua
	use "hrsh7th/cmp-buffer" -- nvim-cmp source for buffer words
	use "hrsh7th/cmp-path" -- nvim-cmp source for filesystem paths
	use "hrsh7th/cmp-cmdline" -- command line completion
	use "saadparwaiz1/cmp_luasnip" -- snipet completion
	use "hrsh7th/cmp-nvim-lsp" -- nvim-cmp source for neovim's built-in LSP

	-- Sniptes
	use "L3MON4D3/LuaSnip" -- snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- LSP
	use "neovim/nvim-lspconfig" -- enable LSP
	use "williamboman/nvim-lsp-installer" -- LSP installer

	-- Colorschemes
	use "sainnhe/sonokai" -- :colorscheme sonokai
	use "ChristianChiarulli/nvcode-color-schemes.vim" -- nvcode, onedark, nord,
													  -- aurora, gruvbox, palenight, snazzy, xoria

	-- TreeSitter
	use {
		"nvim-treesitter/nvim-treesitter",
		run = ':TSUpdate'
    }
	use "JoosepAlviste/nvim-ts-context-commentstring" -- treesitter commenting plugin

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim',

	requires = {
			{'nvim-lua/plenary.nvim'},
		},
	}

	-- GitHub
	use "lewis6991/gitsigns.nvim"

	-- Others
	use "kyazdani42/nvim-tree.lua" -- file explorer
	use "kyazdani42/nvim-web-devicons" -- icons for nvim-tree
	use "windwp/nvim-autopairs" -- autopair plugin that supports multiple characters
	use "numToStr/Comment.nvim" -- easy comment

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end

end)
