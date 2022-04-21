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
local kind_icons = {
  Text = "",
  Method = "m",
  Function = "",
  Constructor = "",
  Field = "",
  Variable = "",
  Class = "",
  Interface = "",
  Module = "",
  Property = "",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "",
  Event = "",
  Operator = "",
  TypeParameter = "",
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
		["C-d"] = cmp.mapping.scroll_docs(-4),
		["C-f"] = cmp.mapping.scroll_docs(4),
		["C-Space"] = cmp.mapping.complete(),
		["<C-k>"] = cmp.mapping.select_prev_item(),
		["<C-j>"] = cmp.mapping.select_next_item(),
		["<S-CR>"] = cmp.mapping.confirm { select = true },
		["<CR>"] = cmp.mapping.confirm { select = false },
		["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jump() then
				fallback()
			else
				fallback()
			end
		end, {"i", "s"}
		),
		["<S-Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			elseif luasnip.jumpable(-1) then
				luasnip.jump(-1)
			else
				fallback()
			end
		end, {"i", "s",}
		),
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
		ghost_text = true,
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
