local helpers = require('lerskk.luasnip-helper-funcs')
local get_visual = helpers.get_visual

local line_begin = require("luasnip.extras.expand_conditions").line_begin

-- Math context detection
local tex = {}
tex.in_mathzone = function() return vim.fn['vimtex#syntax#in_mathzone']() == 1 end
tex.in_text = function() return not tex.in_mathzone() end

return {
  s({
      trig = "cite",
      desc = "parencite"
    },
    fmta(
      [[\parencite{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
  s({
      trig = "pcite",
      desc = "cite with page"
    },
    fmta(
      [[\parencite[p.~<>]{<>}<>]],
      {
        i(1),
        d(2, get_visual),
        i(0),
      }
    )
  ),
  s({
      trig = "ycite",
      desc = "parencite year"
    },
    fmta(
      [[\parencite*{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
  s({
      trig = "tcite",
      desc = "cite title"
    },
    fmta(
      [[\titlecite{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
  s({
      trig = "ftcite",
      desc = "cite full title"
    },
    fmta(
      [[\titlecite*{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),
  s({
      trig = "acite",
      desc = "cite author"
    },
    fmta(
      [[\authorcite{<>}<>]],
      {
        d(1, get_visual),
        i(0),
      }
    )
  ),

}