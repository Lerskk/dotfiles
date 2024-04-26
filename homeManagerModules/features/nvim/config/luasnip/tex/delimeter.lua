local helpers = require("lerskk.luasnip-helper-funcs")
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({ trig = "([^%a])l%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\left(<>\\right)",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])l%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\left[<>\\right]",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])l%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\left{<>\\right}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])b%(", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\big(<>\\big)",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])b%[", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\big[<>\\big]",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])b%{", regTrig = true, wordTrig = false, snippetType = "autosnippet" },
    fmta(
      "<>\\big{<>\\big}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "([^%a])\\%{", regTrig = true, wordTrig = false, snippetType = "autosnippet", priority = 2000 },
    fmta(
      "<>\\{<>\\}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
      }
    )
  ),

  s({ trig = "``", snippetType = "autosnippet" },
    fmta(
      "``<>''",
      {
        d(1, get_visual),
      }
    )
  ),
}
