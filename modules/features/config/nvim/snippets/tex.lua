local ls = require("luasnip")

local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node

local function math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

return {
  s("ov",
    fmta("\\overline{<>}", {
      i(1)
    }),
    { condition = math }
  ),
}
