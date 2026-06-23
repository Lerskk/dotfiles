require "lerskk.core.options"
require "lerskk.core.keymaps"
vim.cmd.colorscheme("catppuccin")

local plugins = {
  "gitsigns",
  "harpoon",
  "lsp",
  "luasnip",
  "oil",
  "spider",
  "surrounds",
  "telescope",
  "treesitter",
  "undotree",
  "vimtex",
}

for _, plugin in ipairs(plugins) do
  require("lerskk.plugins." .. plugin)
end
