-------------------------------------------------------------------------------
-- keymaps.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------


-- :help mapping

-- Options for the keymaps
local opts = { noremap = true, silent = true }
-- local term_opts = { silent = true }

-- Shorten Function Name
local keymap = vim.api.nvim_set_keymap

-- Remap 'space' as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocallerader = " "

-- Normal
-- normal_mode = "n"

-- Creating Lexexplore shortcut
keymap("n", "<Leader>e", ":Lexplore 15<CR>", opts)

-- Update Plugins
-- keymap("n", "<Leader>u", ":PackerSync<CR>", opts)

-- Easier file save
-- keymap("n", "<Leader>w", "<cmd>:w<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprev<CR>", opts)

-- Resize windows with arrows
keymap("n", "<C-j>", ":resize -2<CR>", opts)
keymap("n", "<C-k>", ":resize +2<CR>", opts)
keymap("n", "<C-l>", ":vertical resize +2<CR>", opts)
keymap("n", "<C-h>", ":vertical resize -2<CR>", opts)

-- After searchinig, pressing ecape stops the highlight
keymap("n", "<Esc>", ":noh<CR><Esc>", opts)

-- Visual
-- visual_mode = "v"

-- Stay on indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move Text Up and Down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)

-- Don't copy when pasting
keymap("v", "p", '"_dP', opts)

-- Visual Block
-- visual_block_mode = "x"

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Telescope
keymap("n", "<Leader>f", "<cmd>lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ previewer = false }))<CR>", opts)
-- keymap("n", "<Leader>", "<cmd>Telescope find_files<CR>", opts)
keymap("n", "<C-f>", "<cmd>lua require'telescope.builtin'.live_grep(require('telescope.themes').get_dropdown())<CR>", opts)
