-------------------------------------------------------------------------------
-- colorcheme.lua
-- User: mlanca-c
-- URL: http://github.com/mlanca-c/nvim
-- Version: 2.0
-------------------------------------------------------------------------------

-- Colorscheme: sonokai
-- source: https://github.com/LunarVim/Neovim-from-scratch

vim.cmd [[
try
  colorscheme sonokai
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
