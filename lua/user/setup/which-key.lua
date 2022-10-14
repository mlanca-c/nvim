-------------------------------------------------------------------------------
-- which-key.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/folke/which-key.nvim

local status_ok, wk = pcall(require, "which-key")
if not status_ok then
	return
end

wk.setup {
	plugins = {
		marks = true, -- shows a list of your marks on ' and `
		registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
		spelling = {
			enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
			suggestions = 20, -- how many suggestions should be shown in the list?
		},
		-- the presets plugin, adds help for a bunch of default keybindings in Neovim
		-- No actual key bindings are created
		presets = {
			operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
			motions = false, -- adds help for motions
			text_objects = false, -- help for text objects triggered after entering an operator
			windows = true, -- default bindings on <c-w>
			nav = true, -- misc bindings to work with windows
			z = true, -- bindings for folds, spelling and others prefixed with z
			g = true, -- bindings for prefixed with g
		},
	},
	-- add operators that will trigger motion and text object completion
	-- to enable all native operators, set the preset / operators plugin above
	-- operators = { gc = "Comments" },
	key_labels = {
		-- override the label used to display some keys. It doesn't effect WK in any other way.
		-- For example:
		-- ["<space>"] = "SPC",
		-- ["<CR>"] = "RET",
		-- ["<tab>"] = "TAB",
	},
	icons = {
		breadcrumb = "» ", -- symbol used in the command line area that shows your active key combo
		separator = "➜ ", -- symbol used between a key and it's label
		group = "+ ", -- symbol prepended to a group
	},
	popup_mappings = {
		scroll_down = '<c-d>', -- binding to scroll down inside the popup
		scroll_up = '<c-u>', -- binding to scroll up inside the popup
	},
	window = {
		border = "rounded", -- none, single, double, shadow
		position = "bottom", -- bottom, top
		margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
		padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
		winblend = 0
	},
	layout = {
		height = { min = 4, max = 25 }, -- min and max height of the columns
		width = { min = 20, max = 50 }, -- min and max width of the columns
		spacing = 3, -- spacing between columns
		align = "left", -- align columns left, center or right
	},
	ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
	hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
	show_help = true, -- show help message on the command line when the popup is visible
	triggers = "auto", -- automatically setup triggers
	-- triggers = {"<leader>"} -- or specify a list manually
	triggers_blacklist = {
		-- list of mode / prefixes that should never be hooked by WhichKey
		-- this is mostly relevant for key maps that start with a native binding
		-- most people should not need to change this
		i = { "j", "k" },
		v = { "j", "k" },
	},
	-- disable the WhichKey popup for certain buf types and file types.
	-- Disabled by deafult for Telescope
	--[[ disable = { ]]
	--[[ 	buftypes = {}, ]]
	--[[ 	filetypes = { "TelescopePrompt" }, ]]
	--[[ }, ]]
}

local opts = {
	mode = "n", -- NORMAL mode
	-- prefix: use "<leader>f" for example for mapping everything related to finding files
	-- the prefix is prepended to every mapping part of `mappings`
	prefix = "<leader>",
	buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
	silent = true, -- use `silent` when creating keymaps
	noremap = true, -- use `noremap` when creating keymaps
	nowait = true, -- use `nowait` when creating keymaps
}

local mappings = {

	-- Save and Quit
	["A"] = { "<cmd>qa!<CR>", "Save and Quit All"},
	["Q"] = { "<cmd>qa!<CR>", "Quit All" },
	["q"] = { "<cmd>q!<CR>", "Quit" },
	["W"] = { "<cmd>wa!<CR>", "Save All" },
	["w"] = { "<cmd>w!<CR>", "Save" },
	["c"] = { "<cmd>lua require('user.functions').quit_buffer()<CR>", "Close Window" },
	-- ["c"] = { "<cmd>Bdelete!<CR>", "Close Buffer" },

	-- Toggle colorcolumn
	["b"] = { "<cmd>lua require('user.functions').toggle_colorcolumn()<CR>", "toggle colorcolumn at 80"},

	-- treetoggle
	["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },

	-- Telescope
	["f"] = { "<cmd>Telescope find_files<CR>", "Find files"},
	["F"] = {
		"<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown())<CR>",
		"Find Text"
	},
	-- ["P"] = { "<cmd>Telescope projects<CR>", "Projects" },

	-- Telescope
	["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },

	p = {
		name = "Packer",
		c = { "<cmd>PackerCompile<CR>", "Compile" },
		i = { "<cmd>PackerInstall<CR>", "Install" },
		s = { "<cmd>PackerSync<CR>", "Sync" },
		S = { "<cmd>PackerStatus<CR>", "Status" },
		u = { "<cmd>PackerUpdate<CR>", "Update" },
	},

	g = {
		name = "Git",
		g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
		j = { "<cmd>lua require 'gitsigns'.next_hunk()<CR>", "Next Hunk" },
		k = { "<cmd>lua require 'gitsigns'.prev_hunk()<CR>", "Prev Hunk" },
		l = { "<cmd>lua require 'gitsigns'.blame_line()<CR>", "Blame" },
		p = { "<cmd>lua require 'gitsigns'.preview_hunk()<CR>", "Preview Hunk" },
		r = { "<cmd>lua require 'gitsigns'.reset_hunk()<CR>", "Reset Hunk" },
		R = { "<cmd>lua require 'gitsigns'.reset_buffer()<CR>", "Reset Buffer" },
		s = { "<cmd>lua require 'gitsigns'.stage_hunk()<CR>", "Stage Hunk" },
		u = {
			"<cmd>lua require 'gitsigns'.undo_stage_hunk()<CR>",
			"Undo Stage Hunk",
		},
		o = { "<cmd>Telescope git_status<CR>", "Open changed file" },
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope git_commits<CR>", "Checkout commit" },
		d = {
			"<cmd>Gitsigns diffthis HEAD<CR>",
			"Diff",
		},
	},

	l = {
		name = "LSP",
		a = { "<cmd>lua vim.lsp.buf.code_action()<CR>", "Code Action" },
		d = {
			"<cmd>Telescope lsp_document_diagnostics<CR>",
			"Document Diagnostics",
		},
		w = {
			"<cmd>Telescope lsp_workspace_diagnostics<CR>",
			"Workspace Diagnostics",
		},
		f = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "Format" },
		i = { "<cmd>LspInfo<CR>", "Info" },
		I = { "<cmd>LspInstallInfo<CR>", "Installer Info" },
		j = {
			"<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
			"Next Diagnostic",
		},
		k = {
			"<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>",
			"Prev Diagnostic",
		},
		l = { "<cmd>lua vim.lsp.codelens.run()<CR>", "CodeLens Action" },
		q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>", "Quickfix" },
		r = { "<cmd>lua vim.lsp.buf.rename()<CR>", "Rename" },
		s = { "<cmd>Telescope lsp_document_symbols<CR>", "Document Symbols" },
		S = {
			"<cmd>Telescope lsp_dynamic_workspace_symbols<CR>",
			"Workspace Symbols",
		},
	},

	s = {
		name = "Search",
		b = { "<cmd>Telescope git_branches<CR>", "Checkout branch" },
		c = { "<cmd>Telescope colorscheme<CR>", "Colorscheme" },
		h = { "<cmd>Telescope help_tags<CR>", "Find Help" },
		M = { "<cmd>Telescope man_pages<CR>", "Man Pages" },
		r = { "<cmd>Telescope oldfiles<CR>", "Open Recent File" },
		R = { "<cmd>Telescope registers<CR>", "Registers" },
		k = { "<cmd>Telescope keymaps<CR>", "Keymaps" },
		C = { "<cmd>Telescope commands<CR>", "Commands" },
	},

	t = {
		name = "Terminal",
		n = { "<cmd>lua _NODE_TOGGLE()<CR>", "Node" },
		u = { "<cmd>lua _NCDU_TOGGLE()<CR>", "NCDU" },
		t = { "<cmd>lua _HTOP_TOGGLE()<CR>", "Htop" },
		p = { "<cmd>lua _PYTHON_TOGGLE()<CR>", "Python" },
		f = { "<cmd>ToggleTerm direction=float<CR>", "Float" },
		h = { "<cmd>ToggleTerm size=10 direction=horizontal<CR>", "Horizontal" },
		v = { "<cmd>ToggleTerm size=80 direction=vertical<CR>", "Vertical" },
	},
}

wk.register(mappings, opts)
