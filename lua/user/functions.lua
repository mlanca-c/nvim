-------------------------------------------------------------------------------
-- functions.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

local M = {}

M.toggle_colorcolumn = function()
	local val = vim.api.nvim_get_option_value("colorcolumn", {})
	if val == "" then
		vim.api.nvim_set_option_value("colorcolumn", "80", {})
	else
		vim.api.nvim_set_option_value("colorcolumn", "", {})
	end
end

return M
