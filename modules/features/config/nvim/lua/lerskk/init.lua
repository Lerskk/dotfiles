require "lerskk.core.options"
require "lerskk.core.keymaps"
vim.cmd.colorscheme("catppuccin")

local plugins = {
  "autopairs",
  "gitsigns",
  "harpoon",
  "lsp",
  "luasnip",
  "spider",
  "telescope",
  "treesitter",
  "vimtex",
}

for _, plugin in ipairs(plugins) do
  require("lerskk.plugins." .. plugin)
end
