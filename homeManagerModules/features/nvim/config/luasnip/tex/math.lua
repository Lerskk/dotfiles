local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

-- Return snippet tables
return {
  s({ trig = "([^%a])ff", wordTrig = false, regTrig = true, snippetType = "autosnippet" },
    fmta(
      "<>\\frac{<>}{<>}",
      {
        f(function(_, snip) return snip.captures[1] end),
        d(1, get_visual),
        i(2),
      }
    ),
    { condition = tex.in_mathzone }
  ),
}
