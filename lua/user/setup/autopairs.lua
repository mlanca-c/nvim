-------------------------------------------------------------------------------
-- autopairs.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

local status_ok, npairs = pcall(require, "nvim-autopairs")
if not status_ok then
	return
end

npairs.setup {

	-- treesitter setup
	check_ts = true,
	ts_config = {
		lua = { "string", "source" },	-- it will not add a pair on that
										-- treesitter node
		javascript = { "template_string" },
		java = false, -- don't check treesitter on java
	},

	disable_filetype = { "TelescopePrompt", "spectre_panel" },
	fast_wrap = {
		map = '<M-e>',
		chars = { '{', '[', '(', '"', "'" },
		pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], '%s+', ''),
		end_key = '$',
		keys = 'qwertyuiopzxcvbnmasdfghjkl',
		check_comma = true,
		highlight = 'Search',
		highlight_grey='Comment'
	},
}

-- If you want insert `(` after select function or method item
local cmp_autopairs = require "nvim-autopairs.completion.cmp"

local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
