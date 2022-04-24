# nvim

 [![Intro](https://img.shields.io/badge/Neovim-v0.1-success?style=for-the-badge&logo=nvim)](https://github.com/mlanca-c/nvim)

 [![Stars](https://img.shields.io/github/stars/mlanca-c/nvim?color=ffff00&label=Stars&logo=Stars&style=?style=flat)](https://github.com/mlanca-c/nvim)
 [![Size](https://img.shields.io/github/repo-size/mlanca-c/nvim?color=blue&label=Size&logo=Size&style=?style=flat)](https://github.com/mlanca-c/nvim)
 [![Activity](https://img.shields.io/github/last-commit/mlanca-c/nvim?color=red&label=Last%20Commit&style=flat)](https://github.com/mlanca-c/nvim)



<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/3/3a/Neovim-mark.svg/1200px-Neovim-mark.svg.png" alt="drawing" width="200"/>

> Neovim is a hyperextensible Vim-based text editor fully compatible with Vim's editing model and Vimscript v1.

This is my configuration of nvim highly inspired in [LunarVim](https://github.com/LunarVim).

## Clone

    git clone git@github.com:mlanca-c/nvim.git ~/.config/nvim

## Plugins

* [packer.nvim](https://github.com/wbthomason/packer.nvim) -- Plugin/package management for Neovim.
* [popup.nvim](https://github.com/nvim-lua/popup.nvim) -- An implementation of the Popup API from vim in Neovim.
* [plenary.nvim](https://github.com/nvim-lua/plenary.nvim) -- Useful lua functions for Neovim.
* [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) -- A completion engine plugin for neovim written in Lua.
* [cmp-buffer](https://github.com/hrsh7th/cmp-buffer) -- A nvim-cmp source for buffer words.
* [cmp-path](https://github.com/hrsh7th/cmp-path) -- A nvim-cmp source for filesystem paths.
* [cmp-cmdline](https://github.com/hrsh7th/cmp-cmdline) -- A nvim-cmp source for vim's cmdline.
* [cmp_luasnip](https://github.com/saadparwaiz1/cmp_luasnip) -- A luasnip completion source for nvim-cmp.
* [cmp-nvim-lsp](https://github.com/hrsh7th/cmp-nvim-lsp) -- A nvim-cmp source for neovim's built-in language server client.
* [LuaSnip](https://github.com/L3MON4D3/LuaSnip) -- A snippet Engine for Neovim written in Lua.
* [friendly-snippets](https://github.com/rafamadriz/friendly-snippets) -- Snippets collection for a set of different programming languages for faster development.
* [nvim-lspconfig](https://github.com/neovim/nvim-lspconfig) -- A collection of common configurations for Neovim's built-in language server client.
* [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) -- Neovim plugin that allows you to seamlessly install LSP servers locally.
* [null-ls.nvim](https://github.com/jose-elias-alvarez/null-ls.nvim) -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua.
* [sonokai](https://github.com/sainnhe/sonokai) -- A high Contrast & Vivid Color Scheme based on Monokai Pro
* [nvcode-color-schemes.vim](https://github.com/ChristianChiarulli/nvcode-color-schemes.vim) -- A bunch of generated colorschemes (treesitter supported).
* [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) -- A Neovim Treesitter configuration and abstraction layer.
* [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) -- Neovim treesitter plugin for setting the commentstring based on the cursor location in a file.
* [telescope.nvim](https://github.com/nvim-telescope/telescope.nvim) --  Find, Filter, Preview, Pick. All lua, all the time.
* [gitsigns.nvim](https://github.com/lewis6991/gitsigns.nvim) --  Git integration for buffers.
* [nvim-tree.lua](https://github.com/kyazdani42/nvim-tree.lua) -- A file explorer tree for neovim written in lua.
* [nvim-web-devicons](https://github.com/kyazdani42/nvim-web-devicons) -- A lua fork of [vim-devicons](https://github.com/ryanoasis/vim-devicons). This plugin provides the same icons as well as colors for each icon.

## Install nvim

Ubuntu

    sudo add-apt-repository ppa:neovim-ppa/unstable
    sudo apt-get update
    sudo apt-get install neovim

macOS

    Download nvim-macos.tar.gz
    Extract: tar xzvf nvim-macos.tar.gz
    Run ./nvim-osx64/bin/nvim

Windows

    Download nvim-win64.zip
    Extract the zip.
    Run nvim-qt.exe

## References

* [neovim](https://neovim.io)
* [nvim-from-vim](https://neovim.io/doc/user/nvim.html#nvim-from-vim)
* [LunarVim](https://github.com/LunarVim/neovim-from-scratch)
