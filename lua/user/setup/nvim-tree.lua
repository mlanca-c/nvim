-------------------------------------------------------------------------------
-- nvim-tree.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- source: https://github.com/kyazdani42/nvim-tree.lua

-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
vim.g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "",
    staged = "S",
    unmerged = "",
    renamed = "➜",
    deleted = "",
    untracked = "U",
    ignored = "◌",
  },
  folder = {
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
  },
}

local status_ok, nvim_tree = pcall(require, "nvim-tree")
if not status_ok then
	return
end

-- key can be either a string or a table of string (lhs)
-- action is the name of the action, set to `""` to remove default action
-- action_cb is the function that will be called, it receives the node as a parameter. Optional for default actions
-- mode is normal by default
local status_ok, nvim_tree_config = pcall(require, "nvim-tree.config")
if not status_ok then
	return
end

-- whats this?
local tree_cb = nvim_tree_config.nvim_tree_callback

-- local function print_node_path(node) {
--   print(node.absolute_path)
-- }
-- 
-- nvim-tree.setup = {
-- 	disable_netrw = true,
-- }


nvim_tree.setup {
	disable_netrw = true, -- Disables LexExplore
	hijack_netrw = true,
	open_on_setup = false,
	ignore_ft_on_setup = {
		"startify",
		"dashboard",
		"alpha",
	},
	-- auto_close = true,
	open_on_tab = false,
	hijack_cursor = false,
	update_cwd = true,
	update_to_buf_dir = {
		enable = true,
		auto_open = true,
	},
	diagnostics = {
		enable = true,
		icons = {
			hint = "",
			info = "",
			warning = "",
			error = "",
		},
	},
	update_focused_file = {
		enable = true,
		update_cwd = true,
		ignore_list = {},
	},
	system_open = {
		cmd = nil,
		args = {},
	},
	filters = {
		dotfiles = false,
		custom = {},
	},
	git = {
		enable = true,
		ignore = true,
		timeout = 500,
	},
	view = {
		width = 20,
		height = 20,
		hide_root_folder = false,
		side = "left",
		auto_resize = true,
		mappings = {
			custom_only = false,
			list = {
				{ key = {"l", "<CR>", "o"}, cb = tree_cb "edit" },
				{ key = "h", cb = tree_cb "close_node" },
				{ key = "v", cb = tree_cb "vsplit" },
				{ key = "s", cb = tree_cb "split" },
			},
		},
		number = false,
		relativenumber = false,
	},
	trash = {
		cmd = "trash",
		require_confirm = true,
	},
	quit_on_open = 0,
	git_hl = 1,
	disable_window_picker = 0,
	root_folder_modifier = ":t",
	show_icons = {
		git = 1,
		folders = 1,
		files = 1,
		folder_arrows = 1,
		tree_width = 30,
	},
}
