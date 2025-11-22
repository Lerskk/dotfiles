return {
  'folke/trouble.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {},
  keys = {
    { "<leader>xx", "<cmd>Trouble diagnostic toggre<cr>",     {} },
    { "<leader>xr", "<cmd>Trouble lsp_references toggre<cr>", {} },
    { "<leader>xs", "<cmd>Trouble symbols toggre<cr>",        {} },
    { "<leader>xl", "<cmd>Trouble loclist toggre<cr>",        {} },
    { "<leader>xq", "<cmd>Trouble qflist toggre<cr>",         {} },
  }
}
