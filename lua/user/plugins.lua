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
	-- My plugins here
	use "wbthomason/packer.nvim" -- Have packer manage itself
	use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
	use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins

	-- Auto-Complete
	use "hrsh7th/nvim-cmp" -- completion engine plugin for neovim written in Lua
	use "hrsh7th/cmp-buffer"
	use "hrsh7th/cmp-path"
	use "hrsh7th/cmp-cmdline"
	use "neovim/nvim-lspconfig"
	use "hrsh7th/cmp-nvim-lsp"

	-- Sniptes
	use "L3MON4D3/LuaSnip"
	use "saadparwaiz1/cmp_luasnip"

	-- Colorschemes
	use "sainnhe/sonokai" -- :colorscheme sonokai

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
