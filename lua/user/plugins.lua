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
	use({ "wbthomason/packer.nvim", commit = '00ec5adef58c5ff9a07f11f45903b9dbbaa1b422' }) -- have packer manage itself
	use({ "nvim-lua/popup.nvim", commit = 'b7404d35d5d3548a82149238289fa71f7f6de4ac' }) -- an implementation of the Popup API from vim in Neovim
	use({ "nvim-lua/plenary.nvim", commit = '253d34830709d690f013daf2853a9d21ad7accab' }) -- useful lua functions used ny lots of plugins

	-- My plugins here
	-- Auto-Complete tool
	use({ "hrsh7th/nvim-cmp", commit = '777450fd0ae289463a14481673e26246b5e38bf2' })      -- completion engine plugin for neovim written in Lua
	use({ "hrsh7th/cmp-buffer", commit = '3022dbc9166796b644a841a02de8dd1cc1d311fa' })    -- nvim-cmp source for buffer words
	use({ "hrsh7th/cmp-path", commit = '91ff86cd9c29299a64f968ebb45846c485725f23' })      -- nvim-cmp source for filesystem paths
	use({ "hrsh7th/cmp-cmdline", commit = '8fcc934a52af96120fe26358985c10c035984b53' })   -- command line completion
	use({ "saadparwaiz1/cmp_luasnip", commit = '18095520391186d634a0045dacaa346291096566' }) -- snipet completion
	use({ "hrsh7th/cmp-nvim-lsp", commit = '0e6b2ed705ddcff9738ec4ea838141654f12eeef' })  -- nvim-cmp source for neovim's built-in LSP

	-- Sniptes
	use({"L3MON4D3/LuaSnip", commit = 'a835e3d680c5940b61780c6af07885db95382478'})          -- snippet engine
	use({"rafamadriz/friendly-snippets", commit = '25ddcd96540a2ce41d714bd7fea2e7f75fea8ead'}) -- a bunch of snippets to use

	-- LSP
	use({"neovim/nvim-lspconfig", commit = 'c7f3b14f383e61a6a1893240c293145392a8348c'})        -- enable LSP
	use({"williamboman/nvim-lsp-installer", commit = '17e0bfa5f2c8854d1636fcd036dc8284db136baa'}) -- LSP installer
	use({"jose-elias-alvarez/null-ls.nvim", commit = '456a983ce9843123e51b955f50925077ca7207d5'}) -- LSP diagnostics, code actions, and more via Lua

	-- Colorschemes
	use({"sainnhe/sonokai", commit = 'be321c982bf109b182fb38af2302da838fcaaa02'})                          -- :colorscheme sonokai
	use({"ChristianChiarulli/nvcode-color-schemes.vim", commit = '3a0e624a67ecd2c7f990bc3c25a1044e85782b10'}) -- nvcode, onedark, nord,
	-- aurora, gruvbox,
	-- palenight, snazzy,
	-- xoria

	-- TreeSitter
	use({
		"nvim-treesitter/nvim-treesitter",
		commit = '4536156f32b8ab0aab264e3cd7819fc8e3daede4',
		run = ':TSUpdate'
	})
	use({"JoosepAlviste/nvim-ts-context-commentstring", commit = '729d83ecb990dc2b30272833c213cc6d49ed5214'}) -- treesitter commenting plugin

	-- Telescope
	use {
		"nvim-telescope/telescope.nvim",
		commit = 'a3f17d3baf70df58b9d3544ea30abe52a7a832c2',
		requires = {
			{
				"nvim-lua/plenary.nvim",
				commit = '253d34830709d690f013daf2853a9d21ad7accab'
			},
		},
	}

	-- GitHub
	use({"lewis6991/gitsigns.nvim", commit = '3b6c0a6412b31b91eb26bb8f712562cf7bb1d3be'})

	-- Nvim-Tree
	use({"kyazdani42/nvim-tree.lua", commit = '1d79a64a88af47ddbb55f4805ab537d11d5b908e'})  -- file explorer
	use({"kyazdani42/nvim-web-devicons", commit = '585dbc29315ca60be67d18ae6175771c3fb6791e'}) -- icons for nvim-tree

	-- Which Key
	use({"folke/which-key.nvim", commit = 'd1afcd48f309af58fdb43adc4581bf4b5684768b'})

	-- 42 Studio
	use {
		"pbondoer/vim-42header", -- :Stdheader
		commit = '8adec3f44811398adba275fdcace3e63ba379071',
		ft = { "c", "cpp" },
	}

	-- Others
	use({"windwp/nvim-autopairs", commit = 'e755f366721bc9e189ddecd39554559045ac0a18'})  -- autopair plugin that supports multiple characters
	use({"numToStr/Comment.nvim", commit = '8d3aa5c22c2d45e788c7a5fe13ad77368b783c20'})  -- easy comment
	use({"akinsho/bufferline.nvim", commit = 'b337fd393cef2e3679689d220e2628722c20ddcb'}) -- buffline with tabpage integration
	use({"moll/vim-bbye", commit = '25ef93ac5a87526111f43e5110675032dbcacf56'})          -- allows to close buffers without closing or messing up layout
	use({"akinsho/toggleterm.nvim", commit = 'bfb7a7254b5d897a5b889484c6a5142951a18b29'}) -- plugin to toggle multiple terminals
	use({"nvim-lualine/lualine.nvim", commit = '36b3e39bd3d070be5057e0d9d493926a232e3fae'}) -- neovim statusline

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require('packer').sync()
	end
end)
