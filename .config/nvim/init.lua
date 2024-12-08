-- ***
-- Lazy
-- ***

-- Creates a path to the neovim data dir
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then -- Checks if the path exists
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	})
end

vim.opt.rtp:prepend(lazypath) -- Adds lazy to runtimepath

require("lazy").setup({
	spec = {
		-- Theme
    'navarasu/onedark.nvim',
		--'ms-jpq/coq_nvim',

		-- Extended syntax highlighting
		'nvim-treesitter/nvim-treesitter',

		-- lsp-zero + deps is supposedly the easiest way for extended LSP

		-- Used this tutorial:
		-- https://lsp-zero.netlify.app/docs/getting-started.html
		-- it recommends nvim-cmp as the autocompletion interface and
		-- cmp_nvim_lsp which gives lsp info to nvim-cmp
		-- Trying this for now, later maybe trying coq as the interface?
		{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
		-- Built in neovim LSP
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',

    -- Status line
    'nvim-lualine/lualine.nvim',
    -- and icons for it
    'nvim-tree/nvim-web-devicons',
    'nvim-tree/nvim-tree.lua',
    'numToStr/Comment.nvim',
    {'windwp/nvim-autopairs', event = "InsertEnter", config = true},
    -- Install ripgrep for live_grep to work
    {'nvim-telescope/telescope.nvim', branch = '0.1.x',
     dependencies = { 'nvim-lua/plenary.nvim' }}
	},
})

-- ***
-- General settings
-- ***

-- Defaults possibly overwritten by after/ and ftplugin/
local common = require("common")
common.setTabs(4)
vim.opt.cc = '80' -- The line at the 80th column

-- Common settings
vim.cmd([[
  " Set backspace to behave as it should
  " (allows for moving onto the next/previous line with left/right
  set backspace=eol,start,indent
  set whichwrap+=<,>,h,l
]])
-- Ignore capital letters during search
vim.opt.ignorecase = true
-- Override the above if looking for capitals specifically
vim.opt.smartcase = true
-- Set the y and p to always use the system clipboard
vim.opt.clipboard = 'unnamedplus'
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.termguicolors = true
-- Highlight the current line
vim.opt.cursorline = true

-- All lines are relative EXCEPT for the current line
vim.wo.relativenumber = true
vim.opt.number = true
vim.opt.termguicolors = true

require('onedark').load()

-- Load other settings from ./lua
require("autocompletion")
require("comment-cfg")
require("lsp")
require("keybinds")
require("lualine-cfg")
require("nvim-tree-cfg")
require("nvim-treesitter-cfg")
-- require("tooltip")

