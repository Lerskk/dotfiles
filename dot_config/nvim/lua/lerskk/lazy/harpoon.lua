return {
  "theprimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    'nvim-telescope/telescope.nvim',
  },

  config = function()
    local harpoon = require("harpoon")

    harpoon:setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
    vim.keymap.set("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.keymap.set("n", "<leader>hh", function() harpoon:list():select(1) end)
    vim.keymap.set("n", "<leader>ha", function() harpoon:list():select(2) end)
    vim.keymap.set("n", "<leader>he", function() harpoon:list():select(3) end)
    vim.keymap.set("n", "<leader>hi", function() harpoon:list():select(4) end)
  end

}
