local harpoon = require("harpoon")

harpoon:setup()

local map = vim.keymap.set

map("n", "<leader>a", function() harpoon:list():add() end)
map("n", "<leader>e", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

for i = 1, 9 do
  map("n", "<leader>" .. i, function() harpoon:list():select(i) end)
end
