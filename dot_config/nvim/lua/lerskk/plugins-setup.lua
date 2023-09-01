local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end
local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

local status, packer = pcall(require, 'packer')
if not status then return end

return packer.startup(function(use)
	use 'wbthomason/packer.nvim'

	-- themes
	use { "catppuccin/nvim", as = "catppuccin" }
	use 'rktjmp/lush.nvim'
	use '~/.config/nvim/minimal-dark'

	-- tmux
	use 'christoomey/vim-tmux-navigator'

  -- fzf 
  use {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.2',
    requires = { 
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    }
  }

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
  }

  -- autocompletion
use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},     -- Required
    {'hrsh7th/cmp-nvim-lsp'}, -- Required
    {'L3MON4D3/LuaSnip'},     -- Required
  }
}

  -- surrounds
  use {
    'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup{} end
  }

  

	if packer_bootstrap then
		require('packer').sync()
	end
end)
