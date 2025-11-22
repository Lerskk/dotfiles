return {
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      lsp = {
        progress = { enabled = true },
        hover = { silent = true },
        signature = { enabled = true },
      },
    },
  },
  {
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("notify").setup({
        stages = "fade",
        timeout = 1500,
      })
    end,
  }
}
