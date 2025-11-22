return {
  "utilyre/barbecue.nvim",
  name = "barbecue",

  version = "*",
  dependencies = {
    "SmiteshP/nvim-navic",
    "nvim-tree/nvim-web-devicons", -- optional dependency
  },

  opts = {
    attach_navic = true,
    create_autocmd = true,
    show_dirname = false,
    show_basename = true,
    modifiers = { filename = ":." },
  },

  config = function(_, opts)
    require("barbecue").setup(opts)
  end,
}
