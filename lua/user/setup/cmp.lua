-------------------------------------------------------------------------------
-- cmp.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/hrsh7th/nvim-cmp

-- setup nvim-cmp
local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
	return
end

-- setup luasnip
local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
	return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- Adding Fonts
-- source: https://www.nerdfonts.com/cheat-sheet
-- local kind_icons = {
-- 	Text = "",
-- 	Method = "m",
-- 	Function = "",
-- 	Constructor = "",
-- 	Field = "",
-- 	Variable = "",
-- 	Class = "",
-- 	Interface = "",
-- 	Module = "",
-- 	Property = "",
-- 	Unit = "",
-- 	Value = "",
-- 	Enum = "",
-- 	Keyword = "",
-- 	Snippet = "",
-- 	Color = "",
-- 	File = "",
-- 	Reference = "",
-- 	Folder = "",
-- 	EnumMember = "",
-- 	Constant = "",
-- 	Struct = "",
-- 	Event = "",
-- 	Operator = "",
-- 	TypeParameter = "",
-- }
local kind_icons = {
	Text = " (text)",
	Method = "m (method)",
	Function = " (function)",
	Constructor = " (constructor)",
	Field = " (field)",
	Variable = " (variable)",
	Class = " (class)",
	Interface = " (interface)",
	Module = " (module)",
	Property = " (property)",
	Unit = " (unit)",
	Value = " (value)",
	Enum = " (enum)",
	Keyword = " (keyword)",
	Snippet = " (snippet)",
	Color = " (color)",
	File = " (file)",
	Reference = " (reference)",
	Folder = " (folder)",
	EnumMember = " (enum member)",
	Constant = " (constant)",
	Struct = " (struct)",
	Event = " (event)",
	Operator = " (operator)",
	TypeParameter = " (type parameter)",
}

cmp.setup {
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},

	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},

	mapping = {

		["<C-d>"] = cmp.mapping.scroll_docs(-4),
		["<C-u>"] = cmp.mapping.scroll_docs(4),

		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<S-CR>"] = cmp.mapping.confirm { select = true },
		["<CR>"] = cmp.mapping.confirm { select = false },
		-- ["<Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_next_item()
		-- 	elseif luasnip.expandable() then
		-- 		luasnip.expand()
		-- 	elseif luasnip.expand_or_jump() then
		-- 		fallback()
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {"i", "s"}
		-- ),
		-- ["<S-Tab>"] = cmp.mapping(function(fallback)
		-- 	if cmp.visible() then
		-- 		cmp.select_prev_item()
		-- 	elseif luasnip.jumpable(-1) then
		-- 		luasnip.jump(-1)
		-- 	else
		-- 		fallback()
		-- 	end
		-- end, {"i", "s",}
		-- ),
	},

	formatting = {
		fields = {"kind", "abbr", "menu"},
		format = function(entry, vim_item)
			-- Kind Icons
			vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
			vim_item.menu = ({
				nvim_lsp = "[LSP]",
				buffer = "[Buffer]",
				path = "[Path]",
				luasnip = "[Snippet]",
			})[entry.source.name]
			return vim_item
		end,
	},

	sources = {
		{name = "nvim_lsp"},
		{name = "buffer"},
		{name = "path"},
		{name = "luasnip"},
	},

	options = {
		-- behaviour = cmp.ConfirmBehaviour.Replace,
		-- select = true,
	},

	experimental = {
		ghost_text = false,
	},

	view = {
		entries = "native"
	},
}

-- source: https://github.com/hrsh7th/cmp-cmdline
cmp.setup.cmdline(":", {
	sources = {
		{ name = "cmdline" }
	}
})
cmp.setup.cmdline("/", {
  sources = {
    { name = "buffer" }
  }
})

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

-- The following example advertise capabilities to `clangd`.
require'lspconfig'.clangd.setup {
  capabilities = capabilities,
}
