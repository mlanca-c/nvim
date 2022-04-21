-------------------------------------------------------------------------------
-- telescope.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
	return
end

local actions = require "telescope.actions"

telescope.setup {
	defaults = {

		prompt_prefix = " ",
		selection_caret = " ",
		path_display = {"smart"},

		mappings = {

			i = {
			},

			n = {
			},

		},

	},

	pickers = {
		-- Default configuration for builtin pickers goes here:
		-- picker_name = {
		--   picker_config_key = value,
		--   ...
		-- }
		-- Now the picker_config_key will be applied every time you call this
		-- builtin picker
		find_files = {
			theme = "dropdown",
		},
	},

	-- Your extension configuration goes here:
	-- extension_name = {
	-- 	extension_config_key = value,
	-- }
	-- please take a look at the readme of the extension you want to configure}
}
