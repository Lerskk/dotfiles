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
      { 'nvim-telescope/telescope-fzf-native.nvim',  run = 'make' },
      { 'nvim-telescope/telescope-file-browser.nvim' },
      {
        'nvim-telescope/telescope-frecency.nvim',
        requires = { "kkharji/sqlite.lua" },
        config = function()
        end
      },
      {
        'paopaol/telescope-git-diffs.nvim',
        requires = {
          'sindrets/diffview.nvim'
        }
      }
    }
  }
  use 'theprimeagen/harpoon'

  -- syntax highlight
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    requires = {
      'JoosepAlviste/nvim-ts-context-commentstring',
      'nvim-treesitter/playground'
    }
  }
  use {
    'lukas-reineke/indent-blankline.nvim',
    confign = function()
      require('indent_blankline').setup {
        show_current_context = true,
      }
    end,
  }
  use({
    "utilyre/barbecue.nvim",
    tag = "*",
    requires = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    config = function()
      require("barbecue").setup()
    end,
  })


  -- autocompletion
  use {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v2.x',
    requires = {
      -- LSP Support
      { 'neovim/nvim-lspconfig' },             -- Required
      { 'williamboman/mason.nvim' },           -- Optional
      { 'williamboman/mason-lspconfig.nvim' }, -- Optional

      -- Autocompletion
      { 'hrsh7th/nvim-cmp' },     -- Required
      { 'hrsh7th/cmp-nvim-lsp' }, -- Required
      { 'saadparwaiz1/cmp_luasnip' },
      { 'hrsh7th/cmp-cmdline' },
      { 'hrsh7th/cmp-buffer' },
      { 'onsails/lspkind-nvim' },
      {
        'folke/trouble.nvim',
        requires = { 'nvim-tree/nvim-web-devicons' }
      },
      { 'L3MON4D3/LuaSnip' }, -- Required
    }
  }
  use 'nvimtools/none-ls.nvim'

  -- snipets
  use {
    'L3MON4D3/LuaSnip',
    tag = 'v2.*',
    run = 'make install_jsregexp'
  }


  -- surrounds
  use {
    'kylechui/nvim-surround',
    config = function() require('nvim-surround').setup {} end
  }
  use { "windwp/nvim-autopairs", config = function() require("nvim-autopairs").setup {} end }
  use 'windwp/nvim-ts-autotag'


  -- version control
  use 'lewis6991/gitsigns.nvim'
  use 'mbbill/undotree'

  -- comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
    end,
    after = 'nvim-ts-context-commentstring',
  }
  use { "akinsho/toggleterm.nvim", tag = '*', config = function()
    require("toggleterm").setup()
  end }

  -- obsidian
  use({
    "epwalsh/obsidian.nvim",
    requires = {
      "nvim-lua/plenary.nvim",
    },
  })

  if packer_bootstrap then
    require('packer').sync()
  end
end)
