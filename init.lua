-------------------------------------------------------------------------------
-- init.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- This calls the 'lua/user/options.lua' file
require "user.options"
-- This calls the 'lua/user/keymaps.lua' file
require "user.keymaps"
-- This calls the 'lua/user/colorscheme.lua' file
require "user.colorscheme"
-- This calls the 'lua/user/plugins.lua' file
require "user.plugins"
-- This calls the 'lua/user/functions.lua' file
require "user.functions"
-- This calls the 'lua/user/setup' directory
require "user.setup" -- contains all plugin specific setup configs
