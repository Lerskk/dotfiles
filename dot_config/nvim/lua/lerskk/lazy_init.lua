local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = 'lerskk.lazy',
  change_detection = { notify = false }
})


--   -- highlight
--   {
--     'nvim-treesitter/nvim-treesitter',
--     build = ':TSUpdate',
--     requires = {
--       'JoosepAlviste/nvim-ts-context-commentstring',
--       'nvim-treesitter/nvim-treesitter-textobjects',
--       'nvim-treesitter/playground'
--     },
--   },
--
--   'theprimeagen/harpoon',
--
--   -- completion
--   { 'williamboman/mason.nvim' },
--   { 'williamboman/mason-lspconfig.nvim' },
--   { 'VonHeikemen/lsp-zero.nvim',         branch = 'v3.x' },
--   { 'neovim/nvim-lspconfig' },
--   { 'hrsh7th/cmp-nvim-lsp' },
--   { 'hrsh7th/nvim-cmp' },
--   {
--     'L3MON4D3/LuaSnip',
--     version = 'v2.*',
--     build = 'make install_jsregexp'
--   },
--   { 'saadparwaiz1/cmp_luasnip' },
--   { 'hrsh7th/cmp-cmdline' },
--   { 'hrsh7th/cmp-buffer' },
--   { 'onsails/lspkind-nvim' },
--   {
--     'folke/trouble.nvim',
--     requires = { 'nvim-tree/nvim-web-devicons' }
--   },
--
--   -- version control
--   'lewis6991/gitsigns.nvim',
--   'mbbill/undotree',
--
--   -- comment
--   {
--     'numToStr/Comment.nvim',
--     lazy = false,
--   },
--
-- }, {})
-- --]]
