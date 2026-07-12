local ls = require("luasnip")

local s = ls.snippet
local fmta = require("luasnip.extras.fmt").fmta
local i = ls.insert_node
local f = ls.function_node
local d = ls.dynamic_node
local t = ls.text_node

local function math()
  return vim.fn["vimtex#syntax#in_mathzone"]() == 1
end

local sn = ls.snippet_node
function get_visual(args, parent)
  if (#parent.snippet.env.LS_SELECT_RAW > 0) then
    return sn(nil, i(1, parent.snippet.env.LS_SELECT_RAW))
  else
    return sn(nil, i(1, ''))
  end
end

return {
  s({
      trig = "([^%a])mm",
      wordTrig = false,
      regTrig = true,
      snippetType = "autosnippet",
      desc = "Inline math"
    },
    fmta(
      [[<>$<>$]],
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),
  s({ trig = "([%w%)%]%}]);", wordTrig = false, regTrig = true, snippetType = "autosnippet", desc = "Subscript" },
    fmta(
      "<>_{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        i(1),
      }
    ),
    { condition = math }
  ),
  s("ov",
    fmta("\\overline{<>}", {
      i(1)
    }),
    { condition = math }
  ),

  s({
      trig = "and",
      snippetType = "autosnippet",
      desc = "and"
    },
    {
      t("\\ \\text{and} \\ "),
    },
    { condition = math }
  ),
}
