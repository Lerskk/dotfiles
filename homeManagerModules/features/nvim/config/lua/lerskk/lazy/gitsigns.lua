return {
  {
    'lewis6991/gitsigns.nvim',

    config = function()
      local git = require('gitsigns')
      git.setup {
        current_line_blame = true,
        current_line_blame_opts = { delay = 200 },
        signs = {
          add = { text = "+" },
          change = { text = "~" },
          delete = { text = "_" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
        },

        vim.keymap.set("n", "<leader>gs", ":Gitsigns stage_hunk<CR>"),
        vim.keymap.set("n", "<leader>gr", ":Gitsigns reset_hunk<CR>"),
        vim.keymap.set("n", "<leader>gp", ":Gitsigns preview_hunk<CR>"),
      }
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = "nvim-lua/plenary.nvim",

    config = function()
      require("diffview").setup({})
      vim.keymap.set("n", "<leader>dv", ":DiffviewOpen<CR>")
      vim.keymap.set("n", "<leader>dc", ":DiffviewClose<CR")
    end,
  },
}
