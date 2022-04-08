-------------------------------------------------------------------------------
-- options.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 0.1
--
-- Description: This is the config options file of neovim.
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
	cursorline = true,		-- highlight the text line of the cursor with
							-- cursorLine
	scrolloff = 8,			-- minimal number of screen lines to keep above and
							-- below the cursor.
	sidescrolloff = 8,		-- minimal number of screen columns to keep to the
							-- left and to the right of the cursor if 'nowrap'
							-- is set. 
	cmdheight=2,			-- number of scren lines to use for the
							-- command-line.

	-- Window and Tab Options
	splitbelow = true,	-- force all horizontal splits to go below the current
						-- window.
	splitright = true,	-- force all vertical splits to go to the right of the
						-- current window.
	showtabline = 2,	-- option specifies when the line with tab page labels
						-- 2 is for always
}

-- For Key and Value pairs of 'options', do vim.opt[Key] = value
for k, v in pairs(options) do
	vim.opt[k] = v
end
