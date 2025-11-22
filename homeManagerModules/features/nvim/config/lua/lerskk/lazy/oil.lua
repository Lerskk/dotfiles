return {
  'stevearc/oil.nvim',
  opts = {
    view_options = { show_hidden = true },
    skip_confirm_for_simple_edits = true,
  },
  dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if you prefer nvim-web-devicons
  lazy = false,
  keys = {
    { "\\", "<cmd>Oil<cr>", desc = "Oil" },
  },
}
