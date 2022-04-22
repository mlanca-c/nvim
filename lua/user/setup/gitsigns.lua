-------------------------------------------------------------------------------
-- gitsigns.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source : https://github.com/lewis6991/gitsigns.nvim

local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
	return
end

gitsigns.setup = {
	signs = {

	},
}
