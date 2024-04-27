local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Environment/syntax context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end
tex.in_tikz = function()
  local is_inside = vim.fn['vimtex#env#is_inside']("tikzpicture")
  return (is_inside[1] > 0 and is_inside[2] > 0)
end

return {
  s({
      trig = "q",
      desc = "Quad"
    },
    {
      t("\\quad"),
    }
  ),

  s({
      trig = "qq",
      desc = "Qquad"
    },
    {
      t("\\qquad"),
    }
  ),

  s({
      trig = "npp",
      snippetType = "autosnippet",
      desc = "New page"
    },
    {
      t({ "\\newpage" }),
    },
    { condition = line_begin }
  ),

  s({
      trig = "which",
      snippetType = "autosnippet",
      desc = "Which"
    },
    {
      t("\\text{ for which } "),
    },
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "all",
      snippetType = "autosnippet",
      desc = "For all"
    },
    {
      t("\\text{ for all } "),
    },
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "forall",
      snippetType = "autosnippet",
      desc = "For all"
    },
    {
      t("\\text{ for all } "),
    },
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "and",
      snippetType = "autosnippet",
      desc = "and"
    },
    {
      t("\\quad \\text{and} \\quad"),
    },
    { condition = tex.in_mathzone }
  ),

  s({
      trig = "toc",
      snippetType = "autosnippet",
      desc = "table of contents"
    },
    {
      t("\\tableofcontents"),
    },
    { condition = line_begin }
  ),

  s({
      trig = "inff",
      snippetType = "autosnippet",
      desc = "Infinite"
    },
    {
      t("\\infty"),
    }
  ),

  s({
      trig = "ii",
      snippetType = "autosnippet",
      desc = "Item"
    },
    {
      t("\\item")
    },
    { condition = line_begin }
  ),

  s({
      trig = "--",
      snippetType = "autosnippet",
      desc = "Separator"
    },
    {
      t('% --------------------------------------------- %')
    },
    { condition = line_begin }
  ),

  s({
      trig = "hl",
      snippetType = "autosnippet",
      desc = "Hline with extra vertical space"
    },
    {
      t("\\hline {\\rule{0pt}{2.5ex}} \\hspace{-7pt}")
    },
    { condition = line_begin }
  ),
}
