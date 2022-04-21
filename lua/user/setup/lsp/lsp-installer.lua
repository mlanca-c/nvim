-------------------------------------------------------------------------------
-- lsp-installer.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/williamboman/nvim-lsp-installer

local status_ok, lsp_installer = pcall(require, "nvim-lsp-installer")
if not status_ok then
	vim.notify("Failed to install lsp-installer")
	return
end

-- Register a handler that will be called for each installed server when it's
-- ready (i.e. when installation is finished or if the server is already
-- installed).
lsp_installer.on_server_ready(function(server)
	-- Specifying all default options which will be use to setup all servers
    local opts = {
		on_attach = on_attach,
		capabillities = capabillities,
	}

    -- (optional) Customize the options passed to the server
    -- if server.name == "tsserver" then
    --     opts.root_dir = function() ... end
    -- end

	if server.name == "sumneko_lua" then
		local sumneko_opts = {
			settings = {
				Lua = {
					diagnostics = {
						globals = {"vim"},
					},
					workspace = {
						library = {
							[vim.fn.expand("$VIMRUNTIME/lua")] = true,
							[vim.fn.stdpath("config") .. "/lua"] = true,
						},
					},
				},
			},
		}
		opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
	end

    server:setup(opts)
end)

lsp_installer.settings({
	ui = {
		icons = {
			server_installed = "✓",
			server_pending = "➜",
			server_uninstalled = "✗"
		}
	}
})
