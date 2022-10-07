-------------------------------------------------------------------------------
-- treesitter.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/nvim-treesitter/nvim-treesitter

local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	return
end

configs.setup {

    -- A list of parser names, or "all"
	ensure_installed = "all",
    -- Install parsers synchronously (only applied to `ensure_installed`)
	sync_install = false,
    -- Automatically install missing parsers when entering buffer
    auto_install = false,

	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "" }, -- list of language that will be disabled

		-- Setting this to true will run `:h syntax` and treesitter at the same
		-- time. Set this to `true` if you depend on 'syntax' being enabled
		-- (like for indentation). Using this option may slow down your editor,
		-- and you may see some duplicate highlights.
		-- Instead of true it can also be a list of languages
		additional_vim_regex_highlighting = true,
	},

	indent = {
		enable = true,
	},
}
