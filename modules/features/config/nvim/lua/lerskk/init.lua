require "lerskk.core.options"
require "lerskk.core.keymaps"
vim.cmd.colorscheme("formoun")
-- require("mini.base16").setup({
--   palette = {
--     base00 = "#111418"; -- set background
--     base01 = "#191c20"; -- secondary background
--     base02 = "#36393e"; -- selection
--     base03 = "#5b5f63"; -- comments
--     base04 = "#212428"; -- status line
--     base05 = "#a8abb1"; -- set fg statusline
--     base06 = "#7c9ea5";
--     base07 = "#b7a5c6";
--     base08 = "#9b9ea4"; -- set variables
--     base09 = "#b68d80"; -- set numbers
--     base0A = "#d3be93";
--     base0B = "#9eb18d";
--     base0C = "#a4bdd6";
--     base0D = "#7d95ad";
--     base0E = "#a9cfd5";
--     base0F = "#8b6d61";
--   },
--   use_cterm = true,
-- })

local plugins = {
  "conform",
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
