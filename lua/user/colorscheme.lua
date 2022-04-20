-------------------------------------------------------------------------------
-- colorcheme.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- Colorscheme:
local colorscheme = "sonokai"

-- protected call - instead of vim.cmd "colorscheme <colorscheme>"
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

-- Confirming operation
if not status_ok then
	vim.notify("colorscheme \'" .. colorscheme .. "\' not found!")
	return
end

-- vim.cmd [[
-- try
--   colorscheme sonokai 
-- catch /^Vim\%((\a\+)\)\=:E185/
--   colorscheme default
--   set background=dark
-- endtry
-- ]]
