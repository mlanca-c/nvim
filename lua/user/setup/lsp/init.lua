-------------------------------------------------------------------------------
-- init.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- Protected Call
local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
	return
	vim.notify("Failed to install lspconfig")
end

-- This calls the 'lua/user/setup/lsp/lsp-installer.lua' file
require "user.setup.lsp.lsp-installer"
-- This calls the 'lua/user/setup/lsp/handlers.lua' setup() function
require ("user.setup.lsp.handlers").setup()
