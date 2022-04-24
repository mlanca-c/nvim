-------------------------------------------------------------------------------
-- options.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- :help options
local options = {

	-- Identation Options
	smartindent = true,		-- do smart autoindenting when starting a new line.
	tabstop = 4,			-- show existing tab with 4 spaces width.
	shiftwidth = 4,			-- when identing with '>' use 4 spaces.
	noexpandtab,			-- no spaces when pressing tab.
	wrap = false,			-- don't wrap lines.

	-- GUI Options
	number = true,
	termguicolors = true,
	guifont = {"Hack", "h10"},	-- for MacOs
	cursorline = true,		-- highlight the text line of the cursor with
							-- cursorLine
	scrolloff = 8,			-- minimal number of screen lines to keep above and
							-- below the cursor.
	sidescrolloff = 8,		-- minimal number of screen columns to keep to the
							-- left and to the right of the cursor if 'nowrap'
							-- is set.
	cmdheight=2,			-- number of scren lines to use for the
							-- command-line.
	numberwidth = 4,		-- set number column width to 4
	showmode = false,		-- command line stops showing mode
	title = true,			-- shows the title

	-- Workspace Options
	mouse = "a",			-- enable mouse
	foldenable = false,		-- when off, all folds are open
	foldmethod = "indent",	-- the kind of folding used for the current window

	-- Plugins
	completeopt = { "menu", "menuone", "noselect" }, -- cmp plugin

	-- Window and Tab Options
	splitbelow = true,	-- force all horizontal splits to go below the current
						-- window.
	splitright = true,	-- force all vertical splits to go to the right of the
						-- current window.
	showtabline = 2,	-- option specifies when the line with tab page labels
						-- 2 is for always

}

vim.opt.shortmess:append "c"
local cmd = vim.cmd

cmd [[
	set iskeyword+=-
]]

cmd [[
 autocmd InsertLeave * :set norelativenumber
 autocmd InsertEnter * :set relativenumber
]]

-- For Key and Value pairs of 'options', do vim.opt[Key] = value
for k, v in pairs(options) do
	vim.opt[k] = v
end
