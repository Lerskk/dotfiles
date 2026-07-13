require "lerskk.core.options"
require "lerskk.core.keymaps"

local plugins = {
  "conform",
  "gruvbox-material",
  "gitsigns",
  "harpoon",
  "lsp",
  "luasnip",
  "oil",
  "spider",
  "surrounds",
  "trouble",
  "telescope",
  "treesitter",
  "undotree",
  "vimtex",
}

for _, plugin in ipairs(plugins) do
  require("lerskk.plugins." .. plugin)
end

vim.cmd.colorscheme("formoun")
