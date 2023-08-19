local status, packer = pcall(require, 'packer')
if (not status) then return end

local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system({
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  })
  print("Installing packer close and reopen Neovim...")
  vim.cmd([[packadd packer.nvim]])
end

vim.cmd [[packadd packer.nvim]]

-- autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim' -- plugin manager

  -- themes
  use 'marko-cerovac/material.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- fuzzy finder
  use 'nvim-telescope/telescope.nvim'
  use 'nvim-telescope/telescope-file-browser.nvim'

  use 'nacro90/numb.nvim'

  -- highlight
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }

  -- statusline
  use 'nvim-lualine/lualine.nvim'

  -- dashboard
  use 'glepnir/dashboard-nvim'
  use 'nvim-tree/nvim-tree.lua'

  -- completion
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  -- use 'hrsh7th/cmp-cmdline'
  use 'neovim/nvim-lspconfig'
  use 'gelguy/wilder.nvim'

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'
  use 'onsails/lspkind-nvim' -- vscode-like pictograms

  -- snippets
  use { "L3MON4D3/LuaSnip", run = "make install_jsregexp" }

  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use { 'kylechui/nvim-surround', tag = '*' }

  -- tabline
  use 'nanozuki/tabby.nvim'

  -- git
  use 'lewis6991/gitsigns.nvim'

  -- breadcrums
  use 'utilyre/barbecue.nvim'
  use 'SmiteshP/nvim-navic'

  -- use 'lukas-reineke/indent-blankline.nvim'

  -- pairs
  use 'mrjones2014/nvim-ts-rainbow'
  use 'windwp/nvim-ts-autotag'
  use 'windwp/nvim-autopairs'
  -- use 'Wansmer/treesj'

  -- swap arguments
  use 'Wansmer/sibling-swap.nvim'

  -- save
  use 'Pocco81/auto-save.nvim'

  -- formatter
  use 'jose-elias-alvarez/null-ls.nvim'

  -- latex
  use 'lervag/vimtex'
  use 'kdheepak/cmp-latex-symbols'

  -- obsidian
  use 'epwalsh/obsidian.nvim'

  -- tmux
  use 'christoomey/vim-tmux-navigator'

  -- yuck
  use 'elkowar/yuck.vim'

  -- common dependencies
  use 'nvim-lua/plenary.nvim'
  use 'nvim-tree/nvim-web-devicons'
end)
